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
#   TODO: Elevate first.
#   TODO: getKeyname in 'add-github-pubkey.sh' should use githubMachineName
#
# ==========================================================

# Get some common details

# TODO: validate token for sanity. (what encoding is it, base64?)
# Personal Access Tokens should take the form:
#   a872453ffcef867301439c88792fd0878b4cd098
echo "Enter a new admin:public_key personal access token:"
read token

echo "Enter your email address:"
read email

echo "Enter your github username:"
read username

echo "Enter a name for this machine on github:"
read githubMachineName

echo "You have entered: $email@$githubMachineName continuing install..."

. git.sh
. curl.sh
. setup-ssh-keys.sh "$email" "$githubMachineName"
. add-github-pubkey.sh -u "$username" -t "$token"
