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
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\snap-expect.sh"

logthis "installing expect..."
sudo apt-get -qq install expect -y ; # 1> /dev/null
logthis "finished installing snap-expceted"
