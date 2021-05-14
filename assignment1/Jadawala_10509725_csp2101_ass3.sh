#!/bin/bash
#Student name: Manali Jadawala
#Student id: 10509725

declare -a logs #declare logs array

patt="^serv_acc_log" #search and store this pattern in the patt variable
mennum=1 #set menu number as 1

for file in * ; #loop through the files matching the pattern
do
	if [[ $file =~ $patt ]]; then #compare the variables
		logs+=($(basename $file))
	fi
done


count=${#logs[*]}  #count the files in logs array
echo -e "The logs array contains $count files.\n" #display the number of files in the logs array
for file in "${logs[@]}"; #loop through logs array 
do
	echo -e "$mennum $file" #print the menu number with the file
	((mennum++)) #increment the menu number
done

echo -e "\t"
read -p "Enter the number of the file from the menu above you wish to search, i.e. [1, 2, 3, 4, or 5] or exit [0]: " filenum #display the menu options and ask for input
case $filenum in 
	1) echo "You have selected option 1";;
	2) echo "You have selected option 2";;
	3) echo "You have selected option 3";;
	4) echo "You have selected option 4";;
	5) echo "You have selected option 5";;
	0) echo "Thank you. Exiting" && exit 0;;
	*) read -p "Invalid input. Retry: " $filenum;;
esac


read -p "The directory or file where you want the result to be stored: " usrfiledest  #ask for file in which the user wants the data to be stored

#Records in the class field labelled as normal to be filtered out by making a function
filterOut( ) {
    if [ -f $usrfiledest ]; then
	    rm $usrfiledest
    fi

	sed '/normal/d' $file > $usrfiledest
	read -i -p "Criteria on basis of which you want to search: " criteria #ask for the criteria for search
}

#Export results to a file

seloper=">"
grep "suspicious" $file > $usrfiledest
 
awk ' BEGIN {FS=","; ttlpackets=0; ttlybytes=0; print "PROTOCOL\tSRC IP\tSRC PORT\tDEST IP\tDEST PORT\tPACKETS\tBYTES\tCLASS"}
	NR>1 {
			if ( $8 '"$seloper"' 10 )
				{
					ttlpackets=ttlpackets+$8
					printf "%-6s\t %-15s\t %-10s\t %-15s\t %-10s\t %-5s\t %-10s\t %-10s \n", $3, $4, $5, $6, $7, $8, $9, $13
				}
}
END { print "Total packets for all matching rows is ", ttlpackets }
'< $usrfiledest > $file



read -p "Enter the number of criteria you want to apply: " numcriteria #ask for the number of criterias user wants to pass

if [[ $numcriteria=1 ]]; then
	read -p "Criteria: " oneusrcriteria
elif [[ $numcriteria=2 ]]; then
	read -p "Criteria: " oneusrcriteria twousrcriteria
elif [[ $numcriteria=3 ]]; then
	read - p "Criteria: " oneusrcriteria twousrcriteria thirdusrcriteria
else 
	read -p "Invalid input. Re-enter number of criterias you wish to apply: " numcriteria
fi

filterOut $file 
grep "$oneusrcriteria" $file
grep "$twousrcriteria" $file
grep "$thirdusrcriteria" $file



#PACKETS &/or BYTES field used ask user it they want -gt, -lt, -eq, !(-eq) value they have mentioned
read -p "Value you want the comparison with: " val #ask user for the value for comparison
if [[ "$criteria" = 'PACKETS' && "$criteria" = 'BYTES' ]]; then
	read -p -i "Do you want a greater than this value(G), less than this value(L), equal to this value(E) or not equal to this value(N)? " usrcomp
	if [ $usrcomp = "G" ]; then
		$result=All values in the logs>$val
 	   grep -c $result
	elif [ $usrcomp = "L" ]; then
		$result=All values in the log<$val
	    grep -c $result
	elif [ $usrcomp = "E" ]; then
		$result=All values in the log=$val
    	grep -c $result
	elif [ $usrcomp = "N" ]; then
		$result=All values in the log<$val && All values in the log>$val
    	grep -c $result
	fi		
elif [[ "$criteria" = 'PACKETS' || "$criteria" = 'BYTES']]; then
	read -p -i "Do you want a greater than this value(G), less than this value(L), equal to this value(E) or not equal to this value(N)? " usrcomp
	if [ $usrcomp = "G" ]; then
		$result=All values in the logs>$val
 	   grep -c $result
	elif [ $usrcomp = "L" ]; then
		$result=All values in the log<$val
	    grep -c $result
	elif [ $usrcomp = "E" ]; then
		$result=All values in the log=$val
    	grep -c $result
	elif [ $usrcomp = "N" ]; then
		$result=All values in the log<$val && All values in the log>$val
    	grep -c $result
	fi
fi 

#SRC IP or DEST IP just ask for a partial search 

if [[ $criteria="SRC IP" || $criteria="DEST IP" ]]; then 
	read -p "Enter the the $input you want: " ipsearch
	grep "^$ipsearch" $file
fi 
