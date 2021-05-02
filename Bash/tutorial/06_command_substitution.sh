#!/bin/sh
#
# example of command substitution in bash
#
# Command Substitution: dynamically building commands with variables.
#
# Syntax: $( [...] )

function PathCombine () {
    printDir="${1}${2}";
    #return "${1}${2}";
}

PathCombine "/c/src/scripts/" "bash/tutorial"

ls -la $printDir