#!/bin/bash
echo "what is your name?"
read entered_name
echo -e "\nWelcome " $entered_name 
echo "You go! I go! Here we go! GEEEEEED"

while read line
do
    echo $line
done < input.txt


