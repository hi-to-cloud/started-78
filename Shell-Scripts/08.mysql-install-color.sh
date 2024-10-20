#!/bin/bash
# check id of user ..> id ..> for root user id=0 always
ID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f2)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
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
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installation MYSQL" 

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installation GIT" 

dnf install wget -y &>> $LOGFILE
VALIDATE $? "Installation WGET"

dnf install nginx -y &>> $LOGFILE
VALIDATE $? "Installation NGINX"