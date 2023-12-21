#!/bin/bash

#check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

filesdir=$1
searchstr=$2

#check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
	echo "Error: $filesdir is not a directory"
	exit 1
fi

#find the number of files and matching lines
file_count=$(find "$filesdir" -type f | wc -l)
match_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

#print the results
echo "The number of files are $file_count and the number of matching lines are $match_count"
