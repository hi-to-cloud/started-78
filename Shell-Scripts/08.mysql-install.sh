#!/bin/bash
# check id of user ..> id ..> for root user id=0 always
ID=$(id -u)

if [ $ID -ne 0 ]; then
    exit 1
fi

dnf install mysql -y

# check exit status of previous command
if [ $? -ne 0 ]; then
    exit 1
fi

dnf install git -y

# check exit status of previous command
if [ $? -ne 0 ]; then
    exit 1
fi

dnf install wget -y