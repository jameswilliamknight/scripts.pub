#!/bin/bash

# http://misc.flogisoft.com/bash/tip_colors_and_formatting
# http://stackoverflow.com/questions/5412761/using-colors-with-printf

function red () {
  printf "\e[31m"
}

function black () {
  printf "\e[0m"
}

echo -e "\e[31mHello World!\e[0m no longer coloured."
red
echo -e "Hello World!"
echo -e "bleed test"
printf "test2\n"
black
echo "no longer coloured."

# It is recommended to use printf over echo, as echo may be implemented in different ways.
# printf has more consistent behavior across implementations.
