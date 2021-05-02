#!/usr/bin/env bash
#
# Summary
#
#     This script is an inverse example of the previous, using a regular
#     expression to match user input for a binary yes/no decision.

resumedir=`pwd`

echo "WARNING: This script will murder an innocent puppy."
read -r -p "Are you sure you want to continue? " response

if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    # to get in here I have entered: 'no', 'n'
    if [[ "$response" =~ ^([nN][oO]|[nN])+$ ]]
    then
        echo "user aborted."
    else
        echo "unknown input, aborting."
    fi
    #
    cd "${resumedir}"
    return 0;
else
    # You have the option of cutting this section off and continuing.
    # to skip the ajoining clause you'd have to had entered 'y' or 'yes'
    # ... this clause can be skipped.
fi
#
# still part of the 'else' clause execution flow out here...
#
echo "you entered: '$response'"
cd "${resumedir}"
return 0;
