#!/bin/bash
#Student name : Manali Upendrakumar Jadawala
#student id : 10509725
#get three inputs from the user on command line

let limit=30 #set limit as 30
{ printf %d+ "$@"; echo sum; } | bc

if [ $limit -ge [ $1 + $2 + $3 ] ]; then  #condition to find if the sum is less than or equal to the limit 
    $sum = `expr = $1 + $2 + $3` #setting sum equal to default three inputs from user
    break #break out of the loop
else
    echo "Sum exceeds maximum allowable" #if condition is false print this message
    exit 1 #end the program
fi

#print the sum of the three integers
echo "Sum of $1 and $2 and $3 is $sum"

exit 0 #end the program
