#!/bin/bash

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
provisionpuburl="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"
wget "${provisionpuburl}/ubuntu/github-bootstrap.sh"
wget "${provisionpuburl}/add-github-pubkey.sh"
#mkdir ubuntu ; cd ubuntu
# ${HOME}/src/_provision/ubuntu
wget "${provisionpuburl}/ubuntu/bootstrapper.sh"
wget "${provisionpuburl}/ubuntu/start.md"

wget "${provisionpuburl}/xclip-git-ssh-keys.sh"

chmod +x github-bootstrap.sh
chmod +x add-github-pubkey.sh
chmod +x bootstrapper.sh
#
# TODO: Test. Also, don't run dodgy scripts you've found on the internet, you imbecile.
. bootstrapper.sh
