#!/bin/bash
#Student name : Manali Upendrakumar Jadawala
#student id : 10509725

echo -e "Enter your choice\n1) Pattern to be searched\n2) Whole word match or any match on line\n3) Inverted match: " #display options

read choice #ask for input

read -p 'Please enter your input: ' usrinput #ask for pattern or word to be searched

case $choice in #start the case statement

    1) egrep -ioc "$usrinput" access_log.txt | n -l ;; #display message when user input is 1
    2) egrep -wci "$usrinput" access_log.txt | n -l ;; #display message when user input is 2
    3) egrep -ivc "$usrinput" access_log.txt | n -l ;; #display message when user input is 3
    *) echo "No matches found" ;; #display message when user input is not found

esac #end the case statement

exit 0 #end the program