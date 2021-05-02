#!/bin/sh
#
# 'shift' bash command moves $2 to $1, $3 to $2, and so forth.

echo 'Argument:' $1
shift
echo 'Argument (shifted once):' $1
shift
echo 'Argument (shifted twice):' $1

# james@ubuntu:~/src/scripts/Bash/examples$ ./3_params_extended.sh one two three
# Argument: one
# Argument (shifted once): two
# Argument (shifted twice): three

