#!/bin/bash

getprop() {  #name a function as getprop
    # File name argument is stored in $1
    file_name=$1;
    word_count=$(wc -w < $file_name); #store word count in word_count
    size=$( du -h $file_name | cut -f1); #store size of file mentioned by user in size
    last_modified=$(date +"%d-%m-%y %T" -r $file_name); #store the date and time file was last modified in last_modified
    echo "The file $file_name contains $word_count words and is $size in size and was last modified at $last_modified"; #display this message
} 

getprop $1; #call the function named getprop
