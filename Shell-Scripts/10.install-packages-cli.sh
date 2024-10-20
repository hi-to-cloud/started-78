#!/bin/bash
# check id of user ..> id ..> for root user id=0 always
ID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f2)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]; 
    then
        echo "Please run this script as super user."
        exit 1
    else
        echo "You are super user."
fi

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        # without '-e' colors will not execute
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

for i in $@
do
    echo "Package to install: $i" &>> $LOGFILE
    dnf list installed $i &>> $LOGFILE
    if [ $? -ne 0 ]
    then 
        dnf install $i -y &>> $LOGFILE
        VALIDATE $? "Installation $i" 
    else
        echo -e "$i Aleady Installed...$Y SKIPPING $N"
    fi
done