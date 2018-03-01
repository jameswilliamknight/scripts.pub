#!/usr/bin/env bash
#
# Summary
#   processes all params setting global variable. must be in function.

function logthis (){
    echo "${1}"
    echo "${1}" >> "${HOME}/bootstrap.params.log"
}

function logthisfile () {
    cat $1
    cat $1 >> "${HOME}/bootstrap.params.log"
}

function logthisprintf (){
    printf "${1}"
    printf "${1}" >> "${HOME}/bootstrap.params.log"
}

function loggerstarted () {
    me="$1"
    logthis "! running: '${me}'"
}
