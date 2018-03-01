#!/bin/bash
#
# TODO: clone the whole repo.

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision

sudo apt-get -qq install dos2unix -y

function downloader () {
    urlbase="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"
    wget -q --no-cache "${urlbase}/$1"
    dos2unix logger.sh
    if [ ! -z ${2+x} ] && [ "${2}" != "no-execute" ]; then
        chmod +x logger.sh
    fi
}

downloader "logger.sh"
downloader "generate-ssh-key.sh"
downloader "github-bootstrap.sh"
downloader "ubuntu/params.sh"
downloader "add-github-pubkey.sh"
downloader "ubuntu/bootstrapper.sh"
downloader "setup-ssh-keys.sh"
downloader "git.sh"
downloader "curl.sh"
downloader "snap-expect.sh"
downloader "ubuntu/start.md" "no-execute"

# bazinga
. bootstrapper.sh
