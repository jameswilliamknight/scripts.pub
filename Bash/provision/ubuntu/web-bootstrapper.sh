#!/bin/bash
#
# TODO: clone the whole repo.

cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision

sudo apt-get -qq update ; sudo apt-get -qq install dos2unix wget -y

function downloader () {
    #
    downloadfilename="${1}"
    #
    # https://stackoverflow.com/a/13864829
    if [ ! -z ${2+x} ]
    then
        filename="${2}"
    fi
    urlbase="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"
    wget -q --no-cache "${urlbase}/${downloadfilename}"
    echo "converting: ./${filename}"
    dos2unix "${filename}"
}

downloader "logger.sh"
downloader "generate-ssh-key.sh"
downloader "github-bootstrap.sh"
downloader "ubuntu/params.sh" "params.sh"
downloader "add-github-pubkey.sh"
downloader "ubuntu/bootstrapper.sh" "bootstrapper.sh"
downloader "setup-ssh-key.sh"
downloader "git.sh"
downloader "curl.sh"
#downloader "snap-expect.sh"

# bazinga
. bootstrapper.sh
