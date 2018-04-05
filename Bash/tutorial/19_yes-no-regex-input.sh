#!/usr/bin/env bash
#
# Summary
#
#     This script is an example of using a regular expression to match user
#     input for a binary yes/no decision.

echo "WARNING: This script will murder an innocent puppy."
read -r -p "Are you sure you want to continue? " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    # to get in here you have to enter 'y' or 'yes'
    echo "you entered: '$response'"
    cd "${resumedir}"
    return 0;
else
    # to get in here you have to enter 'n' or 'no'
    if [[ "$response" =~ ^([nN][oO]|[nN])+$ ]]
    then
        echo "user aborted."
    else
        echo "unknown input, aborting."
    fi
    #
    cd "${resumedir}"
    return 0;
fi
