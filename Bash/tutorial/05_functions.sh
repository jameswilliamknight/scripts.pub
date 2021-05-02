#!/bin/sh
#
# example of a function in bash
# also includes: echo syntax, arithemetic expressions, variable assignment, semi-colon placement
#
# functions inside of bash act like a script inside a script. args $1, $2 etc are rescoped.
# functions you declare in bash scripts will overwrite any global shell programs, e.g. 'ls', 'cd'

function sum () {
    # $(( arithemetic expression ))
    output=$(( $1 + $2 ));
    echo "The result is" $output;
    return $(( $output + 2 ));
};

# produces an anonymous variable stored in  $?
sum 4 5;

# echo the last anon var
echo "The returned value is" $?;