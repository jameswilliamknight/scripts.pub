#!/usr/bin/env bash
#
#loggertoken="a5d2fd23" ; source logger.sh ; # paste into script & uncomment
callhelp="$0 must be called using the one-liner command contained within."
#
#   Summary
#       Once loaded, provides the sourcing script with logging functions custom
#       to the sourcerer.
#       Note, logger.sh overrides 'echo' and 'printf' commands.
#
#   Usage
#       Add the single line (see the top of this script) to enable.
#       This script must be on the PATH variable if called directly.
#
#   Author
#       James Knight
#       jknightdev.com
#       j3k.2004@gmail.com
#       @JamesKnight1337
#
#   Development
#       TODO: add verbosity to control what gets output to terminal. Log file should remain untouched.
#
#   ---------------------------------------------------------------------80char\


me=`basename "$0"`

# This token being set in the calling script will be enough proof the script was
#     sourced properly and so shares the same variable scope. Defensive bashing.
if [ "${loggertoken}" != "a5d2fd23" ]; then
    # the script was not sourced correctly
    echo "${callhelp}"
    exit 1;
fi

# make sure this script wasn't called directly from the terminal (not supported)
if [ "${me}" == "bash" ] ; then
    echo "logging from basename=\"bash\" not supported."
    return 1;
fi

echo "target log file, path=\"${HOME}/${me}.params.log\""

function echo (){
    command echo "${1}"
    command echo "${1}" >> "${HOME}/${me}.params.log"
}

# $1 = full path of the file you want to pipe through to your log file.
function logcat () {
    cat $1
    cat $1 >> "${HOME}/${me}.params.log"
}

function printf (){
    command printf "${1}"
    command printf "${1}" >> "${HOME}/${me}.params.log"
}
