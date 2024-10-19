#!/bin/bash

PERSON1=Robert
PERSON2=Raheem

# $PERSON1 or ${PERSON1} same
# for comment 

echo "$PERSON1: Hello $PERSON2, Good Morning"
echo "$PERSON2: Hi $PERSON1, very Good Morning"
echo "$PERSON1: How are you $PERSON2?"
echo "$PERSON2: I am good $PERSON1, How are you"
echo "------------------------------------------"

DATE=$(date)
echo "Script started executing: ${DATE}"

DATE2=$(date + %F)
echo "Script started executing: ${DATE2}"

# o/p:-
# Script started executing: Sat Dec 30 05:43:56 PM UTC 2023
# Script started executing: 2023-12-30