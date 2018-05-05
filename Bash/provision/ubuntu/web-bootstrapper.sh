#!/usr/bin/env bash

provisiondir="${HOME}/src/_provision"
mkdir -p "${provisiondir}"
cd "${provisiondir}"

# -qq = don't output.
sudo apt-get -qq update ; sudo apt-get -qq install dos2unix wget git -y

function downloader () {
    
    downloadfilename="${1}"
    # if the second param to this function isn't set...
    if [ ! -z ${2+xxx} ]
    then
        filename="${2}"
    else
        filename="${downloadfilename}"
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
