#!/bin/bash
#Define the backup directory

backup_dir="$HOME/backup"

# Create the backup directory if it doesn't exist 
mkdir -p "$backup_dir"

# Loop through all items in the home directory 
for item in "$HOME"/*; do 
   
  if [ -f "$item" ]; then
   
     cp "$item" "$backup_dir"
     echo " Backup up  $item"
  fi 
done 
echo " Backup of files in your home directory has been created in $backup_dir "
