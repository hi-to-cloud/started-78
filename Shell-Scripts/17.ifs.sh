#!/bin/bash

# CSV data
csv_data="John,Doe,30,New York
Jane,Smith,25,San Francisco
Bob,Johnson,35,Los Angeles"

# Use a while loop to read each line of CSV data
while IFS=',' read -r first_name last_name age city; do
    echo "First Name: $first_name"
    echo "Last Name: $last_name"
    echo "Age: $age"
    echo "City: $city"
    echo "-----------------"
done <<< "$csv_data"

# o/p:-
# First Name: John
# Last Name: Doe
# Age: 30
# City: New York
# -----------------
# First Name: Jane
# Last Name: Smith
# Age: 25
# City: San Francisco
# -----------------
# First Name: Bob
# Last Name: Johnson
# Age: 35
# City: Los Angeles
# -----------------