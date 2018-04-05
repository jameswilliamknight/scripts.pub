#!/bin/bash

chkinst "atom"
if [ $? != 0 ]; then
    echo "atom not installed"
else
    echo "atom is installed"
fi
