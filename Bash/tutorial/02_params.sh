#!/bin/sh
#
# $1, $2, $3 etc... contain script parameters/arguments

echo First Arg:  $1
echo Second Arg: $2
echo Third Arg:  $3
echo Number of Args: $#
echo All Args: $@

# james@ubuntu:~/src/scripts/Bash/examples$ ./2_params.sh one two three
# First Arg: one
# Second Arg: two
# Third Arg: three
# Number of Args: 3
# All Args: one two three
