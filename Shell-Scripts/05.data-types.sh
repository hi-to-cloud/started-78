#!/bin/bash

NAME="John Doe"
echo $NAME

AGE1=30
AGE2=40
echo $(($AGE1 + $AGE2))


FRUITS=("Apple" "Banana" "Mango")
echo "First value: ${FRUITS[0]}"
echo "Second value: ${FRUITS[1]}"
echo "Third value: ${FRUITS[2]}"
echo "All Fruits: ${FRUITS[@]}"

IS_ACTIVE=true
if [ "$IS_ACTIVE" = true ]; then
    echo "Active"
fi