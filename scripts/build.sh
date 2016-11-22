#!/bin/bash

# The MIT License (MIT)
# Copyright (c) 2015, 2016 Jan T. Sott
#
# This script builds NSIS scripts on non-Windows platforms (e.g. macOS, Linux)
# using native makensis
#
# https://github.com/idleberg/sublime-makensis

# Set path
PATH=/usr/bin:/usr/local/bin:/opt/local/bin:/bin:$PATH

# Check for arguments
if [[ $@ == '' ]]
then
    echo "Error: No arguments passed"
    exit 1
fi

# Native makensis
if makensis -VERSION >/dev/null 
then
    makensis "$@"

    if [ $? -eq 0 ]
    then
        exit 0
    fi
else
    echo "Error: makensis isn't in your PATH environment variable."
fi
