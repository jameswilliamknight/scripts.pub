#!/usr/bin/env bash
#
# Summary
#   dependency for 'expect' a program that can automate your inputs

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    echo "${errormessage}"
    echo "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; me=$(basename "$0"); loggerstarted "${me}"

logthis "installing snap-expceted..."
sudo apt-get -qq install expect -y
logthis "finished installing snap-expceted"
