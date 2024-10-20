#!/bin/bash

set -e  # it tells the shell to stop running the script if any command fails (returns an error).

ID=$(id -u)

if [ $ID -ne 0 ]; then
    exit 1
fi

dnf install mysql -y
dnf install gitt -y
dnf install wget -y

# Note: Automatically Stop by `set -e`
# No match for argument: gitt
# Error: Unable to find a match: gitt