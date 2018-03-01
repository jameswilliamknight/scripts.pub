#!/usr/bin/env bash

# Summary
#
#   This script should be called from:
#       `scripts.pub/Bash/provision/ubuntu/bootstrapper.sh`
#
#   This script
#   - generates an RSA Key Pair, adds it to ssh-agent
#   - requires manual intervention to set passphrase
#
# ==========================================================
if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    logthis "${errormessage}"
    logthis "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\setup-ssh-keys.sh"

if [[ $(($#%3)) > 0 ]] || [[ $1 =~ "^((-[hH])|(--[hH][eEaA][lL][pP]))$" ]] ; then
	logthis "Usage: $0 \"email-address\" \"github-machine-name\" \"passphrase\""
	return 1
fi

email=$1
githubMachineName=$2
passphrase=$3

# Creating RSA Key Pair
logthis "generating ssh key with email='${email}', passphrase='${passphrase}'"
. generate-ssh-key.sh "${email}" "${passphrase}"

privatekeyfile="${HOME}/.ssh/id_rsa"
if [ ! -f "${privatekeyfile}" ]; then
    logthis "private key file='${privatekeyfile}' does not exist."
    return 1;
fi

logthis "private key detected. setting up ssh-agent..."

# ssh-keygen -t rsa -b 4096 -C "$email" -f "${HOME}/.ssh/id_rsa" # -P "${passphrase}"
# Enter file in which to save the key (/home/james/.ssh/id_rsa)
#input-key:<Enter>
#input-passphrase:<Random Gunk, saved somewhere else>

# 3: Set up ssh-agent
pid=$(ssh-agent -s)
sshAgentPID=$(eval $pid | grep -o -E '[0-9]+')

# 3.1: Test that sshAgentPID has been set/exists
if [ -z ${sshAgentPID+x} ]; then
	logthis "provision >  sshAgentPID is unset";
	exit 1;
else
	logthis "provision >  sshAgentPID is set to '$sshAgentPID'";
fi

# 3.2: if $sshAgentPID is not an empty string or null or something...
if [ $sshAgentPID -gt 0 ]; then
    logthis "provision >  pid parsed OK";
    # we now have an integer variable
    ssh-add ~/.ssh/id_rsa
    # You will be prompted to enter your passphrase.
    #
    # Verify this is true...
    logthis "Passphrase now unlocked while logged in"
else
    logthis "provision >  pid is zero or lower"
    exit 1
fi

logthis "Setting git config: email, name, and push.default=simple"
git config --global user.email "$email"
git config --global user.name "$githubMachineName"
git config --global push.default simple
