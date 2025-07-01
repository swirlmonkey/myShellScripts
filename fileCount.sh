#!/bin/bash
# counting the number of files in the directory
count=0
# acquire fileList
declare -a filenames
filenames=(*)
# acquiring only number of files
# | is the pipeline, aka dataflow
# stdin (input) | stdout (output) | stderr (error)
num_entries=$(ls -lq | wc -l)   # -q for non-printable characters
# mock up fileList
# fileList=(2 3 5)

# "${fileList[@]}" allows for referring to the variable while 
# {} are parameter expansion: to define variable name and its subscript
# where [@] ensures each element is expanded as a separate word, preserve spaces within individual elements 
for count in "${num_entries[@]}"
do
    echo "$count"
done

# construct filename
timestamp=$(date +%Y%m%d_%H%M%S)
filename="fileList_${timestamp}.txt"
if [ -e "$filename" ]; then
    echo "$filename exists"
else
    echo "$filename created successfully"
# save file list within a directory to a file
    echo "Here's a list of files in this directory $(pwd)" > fileList.txt
    ls -t >> $filename      # ls -t sort it by time created
    # cat -n $filename
    echo "There are $num_entries files in this directory" >> $filename
fi