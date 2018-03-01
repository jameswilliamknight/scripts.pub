#!/bin/bash
#
# TODO: clone the whole repo.

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
urlbase="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"

wget "${urlbase}/logger.sh" --no-cache
chmod +x logger.sh

wget "${urlbase}/github-bootstrap.sh" --no-cache
chmod +x github-bootstrap.sh

wget "${urlbase}/ubuntu/params.sh" --no-cache
chmod +x params.sh

wget "${urlbase}/add-github-pubkey.sh" --no-cache
chmod +x add-github-pubkey.sh

wget "${urlbase}/ubuntu/bootstrapper.sh" --no-cache
chmod +x bootstrapper.sh

wget "${urlbase}/setup-ssh-keys.sh" --no-cache
chmod +x xclip-git-ssh-keys.sh

wget "${urlbase}/git.sh" --no-cache
chmod +x git.sh

wget "${urlbase}/curl.sh" --no-cache
chmod +x curl.sh

wget "${urlbase}/snap-expect.sh" --no-cache
chmod +x snap-expect.sh

wget "${urlbase}/ubuntu/start.md" --no-cache

# bazinga
. bootstrapper.sh
