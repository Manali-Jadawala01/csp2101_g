#!/bin/bash

declare -a ass1 #declare first array 
declare  -a ass2 #declare second array
ass1=(12 18 20 10 12 16 15 19 8 11) #add values in first array
ass2=(22 29 30 20 18 24 25 26 29 30) #add values in second array

for (( i=0; i<=9; i++ )); #set a c-style loop  
do #Start the for loop
    StudentNum=$((i+1)) #set student's marks in the two assignment as StudenNum
    sum=$((ass1[$i]+ass2[$i])) #add the marks in both assignments and save them in sum
    echo -e "Student_$StudentNum Result:\t $sum" #display this message
done #End the for loop