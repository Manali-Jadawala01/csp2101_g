#!/bin/bash
#Student name : Manali Upendrakumar Jadawala
#Student id : 10509725


read -p "Enter directory name: " dirname # ask user for directory name
dir=0 #set number of directories as zero
emdir=0 #set number of empty directories as zero
fil=0 #set number of files as zero
emfil=0 #set number of empty files as zero

for line in $dirname #start first for loop to loop through each line
do 
    if [ -s -f -l $dirname ]; then #condition is if file in the given directory contains data
        (($fil + 1 = $fil)) #if true then add 1 to files
    else
        (($emfil + 1 = $emfil)) # if false then add 1 to empty files
    fi
done #finish the first for loop

for line in $dirname #start second for loop to loop through each line
do 
    if [ -s -d -l $dirname ]; then #condition is if directory contains any directory 
        (($dir + 1 = $dir)) #if true then add 1 to directory
    else   
        (($emdir + 1 = $emdir)) #if false then add 1 to empty directory
    fi
done

#display the end message
echo -e "The $dirname directory contains\n $fil files that contain data\n $emfil files that are empty\n $dir non-empty directories\n $emdir empty directories"

exit 0 #end the program