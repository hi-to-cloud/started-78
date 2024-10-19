#!/bin/bash
echo "Please enter your username:: "
# if give `read USERNAME` it will print the username in CLI
# for `read -s PASSWORD` it wont print the password in CLI, -s=secure
read USERNAME #USERNAME ..> variable
echo "Please enter your Password:: "
read -s PASSWORD #PASSWORD ..> variable
echo "Username is: $USERNAME, Password is: $PASSWORD"