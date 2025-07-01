#!/bin/bash
# construct filename
timestamp=$(date +%Y%m%d_%H%M%S)
filename="fileList_${timestamp}.txt"
if [ -e "$filename" ]; then
    echo "$filename exists"
else
    echo "$filename created successfully"
# save file list within a directory to a file
    echo "Here's a list of files in this directory $(pwd)" > fileList.txt
    ls >> $filename
fi