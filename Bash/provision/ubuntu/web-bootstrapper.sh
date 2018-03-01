#!/bin/bash
#
# TODO: clone the whole repo.

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
urlbase="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"

wget "${urlbase}/ubuntu/github-bootstrap.sh"
chmod +x github-bootstrap.sh

wget "${urlbase}/add-github-pubkey.sh"
chmod +x add-github-pubkey.sh

wget "${urlbase}/ubuntu/bootstrapper.sh"
chmod +x bootstrapper.sh

wget "${urlbase}/setup-ssh-keys.sh"
chmod +x xclip-git-ssh-keys.sh

wget "${urlbase}/git.sh"
chmod +x git.sh

wget "${urlbase}/curl.sh"
chmod +x curl.sh

wget "${urlbase}/ubuntu/start.md"

# bazinga
. bootstrapper.sh
