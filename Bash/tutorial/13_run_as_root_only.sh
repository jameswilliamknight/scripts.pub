#!/bin/bash
#
# https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "you are running this as root."