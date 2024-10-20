#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$G Source directory exists $N"
else
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)
echo $FILES

# IFS ..> Internal Feild Seperator
while IFS= read -r VAR_LINE # read 1 line by 1 from FILES using VAR_LINE
do
    echo "Deleting file: $VAR_LINE"
    rm -rf $VAR_LINE
done <<< $FILES