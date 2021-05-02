#!/bin/bash


# Summary
#   use the 'type' command, followed by the name.
#   'type' will return a description if it is being used

type cp
#james@james-XPS-15-9550:~/src/scripts$ type cp
#cp is /bin/cp

type random-name
# james@james-XPS-15-9550:~/src/scripts$ type random-name
# bash: type: random-name: not found

# add return codes to script files, and test them from the call site.
some_command
retval=$?
do_something $retval
if [ $retval -ne 0 ]; then
    echo "Return code was not zero but $retval"
fi

# TODO: learn about returning/return codes before uncommenting this.
## Actions
## https://askubuntu.com/a/29596
## If you only need to know if the command succeeded or failed, don't bother
##     testing $?, just test the command directly. E.g.:
#if some_command; then
#    printf 'some_command succeeded\n'
#else
#    printf 'some_command failed\n'
#fi
#
## And assigning the output to a variable doesn't change the return value (well,
##     unless it behaves differently when stdout isn't a terminal of course).
#if output=$(some_command); then
#    printf 'some_command succeded, the output was «%s»\n' "$output"
#fi
#
## https://askubuntu.com/a/555516
## Short form?
#command && echo OK || echo Failed
