#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

# Follow this to configure Email: https://github.com/daws-78s/concepts/blob/main/gmail.MD
# AMI: centos: 8 ..> centos:DevOps321
echo "$MESSAGE" | mail -s "Disk Usage Alert" hi.to.cloud@gmail.com

# echo "body" | mail -s "subject" to-address