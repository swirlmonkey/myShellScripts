#!/bin/bash
echo "Today is $(date)" 
echo "Current directory is $(pwd)"
echo -e "\nEnter directory path"
read the_path

echo -e "\n your path has these files and folders"
ls "$the_path"


