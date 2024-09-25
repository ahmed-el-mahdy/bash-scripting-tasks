#! /bin/bash

# First way: Using positional parameter 

if [ -n "$1" ];
then 
	echo " Value of x from positional parameter: $1 "
fi 

# Second way: Using exported variable 

if [ -n "$x" ]; 
then 
	echo " Value of x from exported variable: $x"
fi 


