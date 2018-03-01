#!/usr/bin/env bash
#
# Summary: Adds the public key (for the current user) to github. This script is
#   intended to be hosted somewhere, downloaded (wget) and modified to add
#   github token.
#
# This script should be called from:
#   `scripts.pub/Bash/provision/ubuntu/bootstrapper.sh`
#
# See README.md in this directory.
#

if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    logthis "${errormessage}"
    logthis "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\add-github-pubkey.sh"

if [[ $(($#%3)) > 0 ]] || [[ $1 =~ "^((-[hH])|(--[hH][eEaA][lL][pP]))$" ]] ; then
    logthis "Usage: $0 \"machine-name\"  \"username\" \"github-token\""
		logthis "actual: $0 $1 $2 $3"
    sleep 5
    return 1
fi
machinename="${1}"
githubusername="${2}"
githubtoken="${3}"
#
# Preparation
#
# If you need to change the token (Personal Access Token), jump on another
#   computer, log in to github, goto:
#   Settings > (Developer Settings) Personal access tokens, and then
#   1. Delete old token(s)
#   2. > "Generate new token": add a description and check "write:public_key"

keyname="${machinename}"
token="${githubtoken}"
data='{"title":"'$keyname'","key":"'`cat "${HOME}/.ssh/id_rsa.pub"`'"}';

logthis "Uploading private key to ${githubusername}@github: ${data}"

curl -v -H "Authorization: token $token" -u "$githubusername" --data "$data" https://api.github.com/user/keys
