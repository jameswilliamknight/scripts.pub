#!/usr/bin/env bash
#
# Summary
#   processes all params setting global variable. must be in function.

function loadbootstrapperparams () {
    USAGE="Usage: $0 -k \"first key+value\" -k \"second key+value\""
    if [ "$#" == "0" ]; then
    	  echo "$USAGE"
    	  exit 1
    fi

    keyRegex="^--[a-zA-Z]{2,}}$";
    function processkvp () {
        if [[ $key =~ $keyRegex ]]; then
            echo "{ \"$key\": \"$value\" }"
        else
            echo "invalid flag format: '$key'"
            exit 1
        fi
    }

    while (( "$#" )); do
        key=$1
        value=$2
        processkvp
        shift 2
    done
}
