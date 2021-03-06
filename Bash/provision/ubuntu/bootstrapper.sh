#!/usr/bin/env bash
#
# Summary
#   This script is for setting up a desktop workstation running the latest Ubuntu LTS.
#
#   This script generates an RSA Key Pair, adds it to ssh-agent
#
# ==========================================================

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    echo "${errormessage}"
    echo "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi

loggertoken="a5d2fd23" ; source logger.sh ; echo "logger loaded - scripts.pub\Bash\provision\ubuntu\bootstrapper.sh"

if [ ! -f "params.sh" ]; then
    logthis "missing: params.sh"
    return 1;
fi
. params.sh ; loadbootstrapperparams "$@"

# Get some common details

# TODO: validate token for sanity. (what encoding is it, base64?)
# Personal Access Tokens should take the form:
#   a872453ffcef867301439c88792fd0878b4cd098
if [ -z ${global_token+x} ]; then
    logthis "Enter a new admin:public_key personal access token:"
    read global_token
fi

# email
if [ -z ${global_email+x} ]; then
    logthis "Enter your git config email address:"
    read global_email
fi

# pc name
if [ -z ${global_pcname+x} ]; then
    logthis "Enter a name for this machine on github:"
    read global_pcname
fi

# github username
if [ -z ${global_githubusername+x} ]; then
    logthis "Enter your github username:"
    read global_githubusername
fi

# github password
if [ -z ${global_githubpassword+x} ]; then
    logthis "Enter your github password:"
    read -s global_githubpassword
fi

# passphrase
if [ -z ${global_passphrase+x} ]; then
    logthis "Enter a passphrase for your ssh private key:"
    read -s global_passphrase
#else
    #logthis "global_passphrase is set to '${global_passphrase}'";
fi

# TODO: Better message
#logthis "You have entered: ${global_email}@${global_pcname} continuing install..."

. git.sh
. curl.sh
. setup-ssh-key.sh "${global_email}" "${global_pcname}" "${global_passphrase}"
. add-github-pubkey.sh "${global_pcname}" "${global_githubusername}" "${global_token}" "${global_githubpassword}"

logthis "finished - bootstrapper.sh"
return 0;
