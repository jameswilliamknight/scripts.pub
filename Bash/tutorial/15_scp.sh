#!/bin/bash
#
# Summary
#   How to (secure) cp a local file to a remote location via ssh

cd ~
echo "testing" > testing.txt
#
# move the file we just created to home directory of 'james' on remote server
scp ./testing.txt james@35.185.246.159:/home/james
