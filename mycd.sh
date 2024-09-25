#!/bin/bash
# Function to change to the user's home directory 
change_to_home() 
{
	cd ~
	echo "Changed Directory To Home: $HOME"
}

# Function to change to the given directory
change_to_directory()
{
local dir=$1
 if [ -d "$dir" ]; then
	cd "$dir"
	echo "Changed directory to: $dir"
 else 
	echo "Error: Directory '$dir' does not exists."
 fi

}

# Check if the script is called with arguments 

if [ $# -eq 0 ]; then 
	change_to_home
else 
	change_to_directory "$1"
fi 

# We can make the srcipt with if stetment 

#mycd() {
#    if [ $# -eq 0 ]; then
#        cd ~
#        echo "Changed directory to home: $HOME"
#    else
#        local dir=$1
#        if [ -d "$dir" ]; then
#            cd "$dir"
#            echo "Changed directory to: $dir"
#        else
#            echo "Error: Directory '$dir' does not exist."
#        fi
#    fi
#}
