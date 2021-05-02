#!/bin/bash
#
#   example usage of "${HOME}/src/scripts/Bash/bin/logger.sh"

# Install
#
# add this line enable. The file logger.sh must be on the PATH variable
# double-check logger.sh for the correct token.
loggertoken="a5d2fd23" ; source logger.sh ;

# Usages
#
echo "Loaded: 'test123' and overriding echo and printf"
printf "this\nis\nmulti\nline\n"

# Note, logger.sh overrides 'echo' and 'printf' commands.
