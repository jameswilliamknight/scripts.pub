#!/usr/bin/env bash
#
# Summary
#     Installs the curl program.
#
# This script should be called from:
#   `scripts.pub/Bash/provision/ubuntu/bootstrapper.sh`

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    echo "${errormessage}"
    echo "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\git.sh"

logthis "installing git-all..."
sudo apt-get -qq install git-all -y
logthis "finished installing git-all"
