#!/bin/bash
# Function to list the current directory
list_current_directory()
{
ls $options
}

# Function to change to the given directory and list contents
change_and_list_directory() 
{
local dir=$1
if [ -d "$dir" ]; then
	cd "$dir"
	echo "Changed directory to: $dir"
	ls $options
else 
	echo "Error: Directory '$dir' does not exits."
fi
}

# Initialize options
options=""

# Prompt user for options
read -p "Enter options  ( -l, -a, -d, -i. -R; space-separated): " choices

# Map user choices to options 
for choice in $choices; do
     case $choice in
          -l|-a|-d|-i|-R) options="$options $choice" ;;
          *) echo "Invalid Options: $choice" ;;
     esac
done

#check if the script is called with argumens
if [ $# -eq 0 ]; then
	list_current_directory
else 
	change_and_list_directory "$1"
fi

