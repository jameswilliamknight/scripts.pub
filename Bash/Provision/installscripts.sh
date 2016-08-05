#!/usr/bin/env bash

# Make a program executable from anywhere
# Append ~/.bashrc with the following:
# >   export PATH=$PATH:</path/to/file>

# Rename to your user, example here uses 'james' user.

echo "export PATH=$PATH:/home/james/src/scripts.pub/Bash/bin" >> ~/.bashrc
echo "installed script: helloworld"
