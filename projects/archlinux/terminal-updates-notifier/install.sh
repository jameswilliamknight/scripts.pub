#!/usr/bin/env bash
set -euxo pipefail # https://linuxtect.com/make-bash-shell-safe-with-set-euxo-pipefail/

user="$(whoami)"
group="$(groups $user)"
# TODO: better group check: https://stackoverflow.com/a/46651233

if [ "$EUID" -eq 0 ] || [ "$group" == "root" ]; then
    echo "This install script must be run for/as a non-root user."
    exit 1;
fi

sudo pacman -Syy cronie
sudo systemctl enable --now cronie.service

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BIN_DIR="$SCRIPT_DIR/bin"

source "$SCRIPT_DIR"/add-root-cronjob_downloaded-packages --install-cron

cat <<EOT >> ~/.bashrc
# Terminal Updates Notification in Arch Linux
PATH+=":$BIN_DIR"
# check if there are package updates and notify user.
# installed with archlinux/install/mine/download-packages-install/add-bashrc-check.sh
bash is-offline-updates-ready
if [ \$? -eq 0 ]; then
    echo "Updates available. Run 'upgrade-packages' to install."
fi
EOT
