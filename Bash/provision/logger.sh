#!/usr/bin/env bash
#
# Summary
#   processes all params setting global variable. must be in function.

function logthis (){
    echo "${1}"
    echo "${1}" >> "${HOME}/bootstrap.params.log"
}

function logthisprintf (){
    printf "${1}"
    printf "${1}" >> "${HOME}/bootstrap.params.log"
}

# function loggerstarted () {
#     me=`basename "$0"`
#     logthis "logger started for ${me}"
# }

function loggerstarted () {
    me="$1"
    logthis "logger started for ${me}"
}
