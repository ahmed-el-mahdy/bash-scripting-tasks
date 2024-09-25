#!/bin/bash

# Define the home directory 
cd ~

# Loop through all files and directories in the home directory 
for item in *; do 
	if [ -f "$item" ] || [ -d "$item" ]; then 
	# Add execute permission 
	chmod +x "$item"
	fi
done
echo " Execute permission have been added to all files and directories "
