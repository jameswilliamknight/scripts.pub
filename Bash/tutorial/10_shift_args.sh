#!/bin/bash
#
# Summary:
#
#   This example script shows you how to take in argument key value pairs.
#   The key will be a flag preceded with a hyphen. The value may be represented
#     by any string.
USAGE="Usage: $0 -k \"first key+value\" -k \"second key+value\""

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi
#
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html

# This check could also echo the $USAGE
if [[ $(($#%2)) > 0 ]] ; then
  echo "You entered $# parameter(s), this script requires an even number."
  exit 1
fi

keyRegex="^-[a-zA-Z]$";
function processkvp () {
  if [[ $key =~ $keyRegex ]]; then
    echo "{ \"$key\": \"$value\" }"
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
