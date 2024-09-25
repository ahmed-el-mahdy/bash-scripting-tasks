#!/bin/bash
echo "Enter a character:"
read str

# Check the type of string 
if [[ -z "$str" ]]; then 
	echo "Nothing"
elif [[ "$str" =~ ^[A-Z]+$ ]]; then
	echo "Upper Case"
elif [[ "$str" =~ ^[a-z]+$ ]]; then 
	echo "Lower Case"
elif [[ "$str" =~ ^[0-9]+$ ]]; then 
	echo "Number" 
else 
	echo "MIX"
fi 


















# Check if the character is uppercase, lowercase, or a digit
#case "$ch" in 
#	[A-Z])
#	echo "Upper Case"
#	;;
#	[a-z])
#	echo "Lower Case"
#	;;
#	[0-9])
#	echo "Number"
#	;;
#	*)
#	echo "Nothing"
#	;;
#esac
