#!/bin/bash
#
# Summary:
#
#   This script prompts the user to type in a password, and keeps it hidden
#     within the scope of the script. For the purpose of demonstration, this
#     script will echo the entered password back out.

## Basic Example
##
## Read password
#echo -n Password:
#read -s password
#echo
## Run commands
#echo $password

# Confirmation example
#
username="example-user"
while [ true ]
do
  echo -n "Password for $username:"
  read -s password
  echo
  echo -n "Confirm password for $username:"
  read -s passwordConfirm
  echo
  if [ "$password" == "$passwordConfirm" ] && [ "$password" != "" ]
  then
    break;
  else
    if [ "$password" == "" ]; then
      echo "Please enter a valid password, try again."
    else
      echo "Passwords did not match, please try again."
    fi
  fi
done

echo "finished setting up password for '$username'!"
