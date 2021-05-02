#!/bin/bash
#
# Summary: 1) Process a section of bash script before processing the line as a
#          whole
#
#          2) Check if a variable has been set, name of variable is held inside
#          a variable. Given the name of a variable, echo what that variable
#          contains, but only if it exists.

# 1)
if [[ `echo "1"` == 1 ]]; then
  echo "this was true: 1 == 1"
fi

# 2)
otherVariable="some data..."
thisVarIsSet="otherVariable"
if [[ -v $thisVarIsSet ]]; then
  # TODO: Also check if $otherVariable exists...?
  echo 'successfully tested: '$thisVarIsSet'="'$(eval echo "\$$thisVarIsSet")'"'
  #output:
  #successfully tested: otherVariable="some data..."
fi
