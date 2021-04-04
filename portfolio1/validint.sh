#!/bin/bash
#Student name : Manali Upendrakumar Jadawala
#student id : 10509725

while true; do #start an while loop and set it to true and the loop will terminate when the condition will be true
    read -p 'Enter integer which is either 20 or 40: ' vlidnum #ask for input 20 or 40
    if [[ $vlidnum = 20 || $vlidnum = 40 ]]; then 
        break #if the condition is true then break out of the loop
    else
        echo "Invalid integer entered - please try again" #if the condition is false then display this message and continue to loop
    fi
done

echo "Valid integer entered. Thank you" #display this exit message

exit 0 #end the program