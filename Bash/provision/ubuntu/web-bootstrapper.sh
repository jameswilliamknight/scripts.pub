#!/bin/bash
#
# TODO: clone the whole repo.

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
urlbase="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"

sudo apt-get -qq install dos2unix -y

wget -q "${urlbase}/logger.sh" --no-cache
dos2unix logger.sh
chmod +x logger.sh


wget -q "${urlbase}/github-bootstrap.sh" --no-cache
dos2unix github-bootstrap.sh
chmod +x github-bootstrap.sh

wget -q "${urlbase}/ubuntu/params.sh" --no-cache
dos2unix params.sh
chmod +x params.sh

wget -q "${urlbase}/add-github-pubkey.sh" --no-cache
dos2unix add-github-pubkey.sh
chmod +x add-github-pubkey.sh

wget -q "${urlbase}/ubuntu/bootstrapper.sh" --no-cache
dos2unix bootstrapper.sh
chmod +x bootstrapper.sh

wget -q "${urlbase}/setup-ssh-keys.sh" --no-cache
dos2unix setup-ssh-keys.sh
chmod +x setup-ssh-keys.sh

wget -q "${urlbase}/git.sh" --no-cache
dos2unix git.sh
chmod +x git.sh

wget -q "${urlbase}/curl.sh" --no-cache
dos2unix curl.sh
chmod +x curl.sh

wget -q "${urlbase}/snap-expect.sh" --no-cache
dos2unix snap-expect.sh
chmod +x snap-expect.sh

wget -q "${urlbase}/ubuntu/start.md" --no-cache
dos2unix start.md

# bazinga
. bootstrapper.sh
