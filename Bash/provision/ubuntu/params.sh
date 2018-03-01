#!/usr/bin/env bash
#
# Summary
#   processes all params setting global variable. must be in function.

function logthis (){
    echo "${1}"
    echo "${1}" >> "${HOME}/bootstrap.params.log"
}

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
            logthis "{ \"$key2\": \"$value\" }"
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
