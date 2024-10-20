#!/bin/bash

set -e

FAILURE(){
    echo "Failed at $1: $2"
}

trap 'FAILURE ${LINENO} "$BASH_COMMAND"' ERR

ID=$(id -u)

if [ $ID -ne 0 ]; then
    exit 1
fi

dnf install mysql -y
dnf install gitt -y
dnf install wget -y

# Note: with help of `trap` we cam capture errors
# No match for argument: gitt
# Error: Unable to find a match: gitt
# Failed at 18: dnf install gitt -y
