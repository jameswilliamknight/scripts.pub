#!/bin/bash

# Summary
#
#   This script
#   - must be run on a terminal emulator loaded in the Ubuntu GNOME environment.
#   - installs xclip
#   - installs git
#   - generates an RSA Key Pair,
#   - adds RSA Key Pair to ssh-agent
#   - prints locations of added files
#   - sends the public key to clipboard (mouse3 / middle mouse / three finger tap / wheel click)
#
# Usage
#
#   ./github-bootstrap.sh "email@address.com"
#
# ==========================================================

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    echo "${errormessage}"
    echo "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted

if [[ ! $(($#)) = 2 ]] || [[ $1 =~ "^((-[hH])|(--[hH][eEaA][lL][pP]))$" ]] ; then
	echo "Usage: $0 \"email@address.com\" \"your-computers-name\""
	exit 1
fi

email=$1;
computerName=$2

# 1: Install xclip
sudo apt install xclip -y

# 1: Install git
sudo apt install git -y

# 2: Creating RSA Key Pair
ssh-keygen -t rsa -b 4096 -C "$email"
# Enter file in which to save the key (/home/james/.ssh/id_rsa)
#input-key:<Enter>
#input-passphrase:<Random Gunk, saved somewhere else>

# 3: Set up ssh-agent
pid=$(ssh-agent -s)
sshAgentPID=$(eval $pid | grep -o -E '[0-9]+')

# 3.1: Test that sshAgentPID has been set/exists
if [ -z ${sshAgentPID+x} ]; then
	echo "provision >  sshAgentPID is unset";
	exit 1;
else
	echo "provision >  sshAgentPID is set to '$sshAgentPID'";
fi

# 3.2: if $sshAgentPID is not an empty string or null or something...
if [ $sshAgentPID -gt 0 ]; then
    echo "provision >  pid parsed OK";
    # we now have an integer variable
    ssh-add ~/.ssh/id_rsa
    # You will be prompted to enter your passphrase.
    #
    # Verify this is true...
    echo "Passphrase now unlocked while logged in"
else
    echo "provision >  pid is zero or lower"
    exit 1
fi

# get the screen to echo locations of saved private and public keys etc.

printf "\n==========provision=============\n\n"
printf "The key pair are located at:\n\n"
echo "    " ~/.ssh/id_rsa
echo "    " ~/.ssh/id_rsa.pub
printf "\nPlease upload these to your github account"
printf "\nsee: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"

# 'tr -d' strips newline characters
cat ~/.ssh/id_rsa.pub | tr -d '\n' | xclip -i

printf "\nThe public key has been copied to the ('Mouse 3' / 'Mouse Wheel Down') clipboard!\n"
printf "\n================================\n\n"

git config --global user.email "$email"
git config --global user.name "$computerName"
git config --global push.default simple
