#!/bin/bash
echo "Hello, $1!"
# $1 denotes 1st argument passed, $2 for second etc
# when running the script like so: ./in_out2.sh Justin
# outputs as Hello, Justin!

# write to a file
echo "information to be imported" > output.txt
# to append to existing file
echo "some additional info" >> output.txt

