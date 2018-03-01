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

return 0;
