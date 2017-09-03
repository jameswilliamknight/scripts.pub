#!/usr/bin/env bash
#
# Summary: Adds the public key (for the current user) to github. This script is
#          intended to be hosted somewhere, downloaded (wget) and modified to
#          add github token.
#
# See README.md in this directory.
#
if [[ $(($#%2)) > 0 ]] || [[ $1 =~ "^((-[hH])|(--[hH][eEaA][lL][pP]))$" ]] ; then
	echo "Usage: $0 -u \"username\" -t \"github-token\""
	exit 1
fi
#
# Preparation
#
# If you need to change the token (Personal Access Token), jump on another
#   computer, log in to github, goto:
#   Settings > (Developer Settings) Personal access tokens, and then
#   1. Delete old token(s)
#   2. > "Generate new token": add a description and check "write:public_key"

# TODO: check id_rsa.pub exists and exit if it doesn't.


function getInput () {
  varName=$1
  varDesc=$2

  if [[ -v $varName ]]; then
    echo "$varName is already set!"
    return
  fi

  if [ "$#" == "2" ]; then
    # prompt user
    echo -n "Enter $varDesc:"
    read $varName
  elif [ "$#" == "3" ]; then
    username="$3"
  else
    echo "error getting $varDesc"
    exit 1
  fi
}

function getUsername () {
  getInput "username" "github username" $1
}

function getToken () {
  getInput "token" "github access token" $1
}

function getKeyname () {
  getInput "keyname" "public key name" $1
}

function processkvp () {
  if [[ $key =~ ^-[a-zA-Z]$ ]]; then
    #echo "{ \"$key\": \"$value\" }"
    if [[ "$key" =~ ^-[uU]$ ]]; then
      username=$value
    elif [[ $key =~ ^-[tT]$ ]]; then
      token=$value
    elif [[ $key =~ ^-[kK]$ ]]; then
      keyname=$value
    else
      echo "invalid flag: $key"
      exit 1;
    fi
  else
    echo "invalid flag format: '$key'"
    exit 1
  fi
}

while (( "$#" )); do

  key=$1
  value=$2
  processkvp
  shift 2

done

getUsername
getToken
getKeyname
data='{"title":"'$keyname'","key":"'`cat ~/.ssh/id_rsa.pub`'"}';
echo "Uploading private key to $username@github: $data"
curl -v -H "Authorization: token $token" -u "$username" --data "$data" https://api.github.com/user/keys