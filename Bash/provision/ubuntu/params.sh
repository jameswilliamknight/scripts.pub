#!/usr/bin/env bash
#
# Summary
#   processes all params setting global variable. must be in function.

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    logthis "${errormessage}"
    logthis "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\ubuntu\params.sh"

function loadbootstrapperparams () {
    USAGE="Usage: $0 -k \"first key+value\" -k \"second key+value\""
    if [ "$#" == "0" ]; then
    	  logthis "$USAGE"
    	  return 1;
    fi

    keyRegex="^--[a-zA-Z_-]{2,}$";
    function processkvp () {
        if [[ $key =~ $keyRegex ]]; then
            key2="global_${key//-/}"
            #logthis "{ \"$key2\": \"$value\" }"
            magic=$(echo "${key2}=\"${value}\"")
            #logthis "MAGIC: ${magic}"
            eval ${magic}
        else
            logthis "invalid flag format: '$key'"
            return 1;
        fi
    }

    while (( "$#" )); do
        key=$1
        value=$2
        processkvp
        #if [[ $? > 0 ]]; then
        #    logthis "error, exiting."
        #fi
        shift 2
    done

    return 0;
}
