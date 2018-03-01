#!/bin/bash

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
provisionpuburl="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"

wget "${provisionpuburl}/ubuntu/github-bootstrap.sh"
chmod +x github-bootstrap.sh

wget "${provisionpuburl}/add-github-pubkey.sh"
chmod +x add-github-pubkey.sh

wget "${provisionpuburl}/ubuntu/bootstrapper.sh"
chmod +x bootstrapper.sh

wget "${provisionpuburl}/xclip-git-ssh-keys.sh"
chmod +x xclip-git-ssh-keys.sh

wget "${provisionpuburl}/ubuntu/start.md"

# bazinga
. bootstrapper.sh
