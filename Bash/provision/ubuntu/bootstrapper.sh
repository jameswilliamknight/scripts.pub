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
#
# ==========================================================

# Get some common details

echo "Have your public access token from github ready in the clipboard."

read -p "I'm ready! (press any key)"

echo "Enter your email address:"
read email
# TODO: validate email address with simple regex

echo "Enter your github username:"
read username

echo "Enter a name for this machine on github:"
read githubMachineName

# TODO: allow re-entry.
echo "You have entered: $email@$githubMachineName continuing install..."

../xclip-git-ssh-keys.sh "$email" "$githubMachineName"
../add-github-pubkey.sh -u "$username"
