#!/usr/bin/env bash
#
# Summary
#   This script is for setting up a desktop workstation
#     running the latest stable release of Ubuntu GNOME.
#
#   This script installs: xclip, git
#     it then, generates an RSA Key Pair, adds it to ssh-agent
#     and finally prints locations of added files, and sends
#     the public key to clipboard (middle mouse/ wheel click)
#
#   TODO: Display on jknightdev.com alongside start.md
#   TODO: getKeyname in 'add-github-pubkey.sh' should use githubMachineName
#
# ==========================================================

. params.sh ; loadbootstrapperparams "$@"

# Get some common details

# TODO: validate token for sanity. (what encoding is it, base64?)
# Personal Access Tokens should take the form:
#   a872453ffcef867301439c88792fd0878b4cd098
if [ -z ${global_token+x} ]; then
    echo "Enter a new admin:public_key personal access token:"
    read global_token
else
    echo "global_token is set to '${global_token}'";
fi

# email
if [ -z ${global_email+x} ]; then
    echo "Enter your git config email address:"
    read global_email
else
    echo "global_email is set to '${global_email}'";
fi

# pc name
if [ -z ${global_pcname+x} ]; then
    echo "Enter a name for this machine on github:"
    read global_pcname
else
    echo "global_pcname is set to '${global_pcname}'";
fi

# github username
if [ -z ${global_githubusername+x} ]; then
    echo "Enter your github username:"
    read global_githubusername
else
    echo "global_ is set to '${global_githubusername}'";
fi

# github password
if [ -z ${global_githubpassword+x} ]; then
    echo "Enter your github password:"
    read -s global_githubpassword
else
    echo "global_githubpassword is set to '${global_githubpassword}'";
fi

# passphrase
if [ -z ${global_passphrase+x} ]; then
    echo "Enter a passphrase for your ssh private key:"
    read -s global_passphrase
else
    echo "global_passphrase is set to '${global_passphrase}'";
fi

echo "You have entered: ${global_email}@${global_pcname} continuing install..."

. git.sh
. curl.sh
. setup-ssh-keys.sh "${global_email}" "${global_pcname}" "${global_passphrase}"
. add-github-pubkey.sh -u "${global_githubusername}" -t "${global_token}"
