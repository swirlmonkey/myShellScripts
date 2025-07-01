#!/bin/bash
# counting the number of files in the directory
count=0
# acquire fileList
declare -a filenames
filenames=(*)
# acquiring only number of files
# | is the pipeline, aka dataflow
# stdin (input) | stdout (output) | stderr (error) ## can be chained further
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
    ls -t | cat -n >> $filename      # ls -t sort it by time created and the number of files
    # cat -n >> $filename           # to add number of the index of each file per line
    bareVid=$(ls | grep -iE "\.(mp4|avi|mkv)")   # to find files in a eg. movie folder that are not packed inside a folder, exposing .mp4 or other extensions 
    echo -e "There are $num_entries files in this directory \n" >> $filename
    echo -e "These files are not in folders \n $bareVid"
fi