#!/bin/bash
#
# Summary:
#
#   pass in a string parameter. If it only contains lowercase a-z and no
#     whitespace it should pass. Otherwise it will fail.

if [[ $1 =~ ^((-[hH])|(--[hH][eEaA][lL][pP]))$ ]]; then
  echo "this is how you trigger halp!";
  exit 1337;
fi

re="^[a-z]+$"
textparam=$1
if [[ $textparam =~ $re ]]; then
  echo "Input '$1' matches $re";
else
  echo "Input does not match. To match, pass a-z lowercase, no whitespace.";
  exit 1;
fi
