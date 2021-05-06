#!/bin/bash
#call the awk command and start an if else statement to print the message if criteria is met or not by checking data in usrpword.txt
awk ' 
NR>1 {
    if(length($2) >= 8 && $2 ~ /[A-Z]/ && $2 ~ /[0-9]/) {
        print ""$2" meets the password requirements"
} else {
    print ""$2" does not meet the password requirements"
}
}' usrpwords.txt
