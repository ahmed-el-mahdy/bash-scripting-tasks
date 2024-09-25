#!/bin/bash 


# Function to copy a single file to another location 

copy_file()
{
	if [ $# -ne 2 ]; then
	   echo " Usage: $0 <source_file> <destination_file>"
   	   exit 1
	fi

source_file=$1
destination_file=$2

# check if source file exists 
 	if [ ! -f "$source_file" ]; then 
		echo "Error: Source file '$source_file' not found."
		exit 1
	fi 
# Copy the file 

cp "$source_file" "$destination_file"
echo "File '$source_file' copied to '$destination_file'."
}


# Function to copy multiple files to a directory 

copy_files_to_directory() 
{
	if [ $# -lt 2 ]; then 
		echo "Usage: $0 <file1> <file2>......<fileN> <destination_directory>" 
		exit 1
	fi

# Get the last argument as destination directory 
destination_directory="${@: -1}"

#check if the last argument is a directory 
if [ ! -d "$destination_directory" ]; then
	echo "Error: Destination '$destination_directory' is not directory. "
	exit 1
fi

# Loop through all arguments except the last (files to copy)
for (( i=1; i<=$#-1; i++ )); do 
	source_file="${!i}"  # Get the argument by the index 
	# Chech if source file exists 
	if [ ! -f "$source_file" ]; then
	echo "warning: source file '$source_file' not found . skipping.."
	continue
	fi 
# Copy the file to the destination directory 
  cp "$source_file" "$destination_directory/"
  echo "File '$source_file' copied to '$destination_directory/'."
done
}

# Check if the script is called with arguments 
 if [ $# -lt 1 ]; then 
	 echo "Usage: $0 <source_file> <destination_file> OR $0 <file1> <file2> ...<filen> <destination_directory>"
	exit 1
fi

# Check the number of arguments and call appropiate function
 if [ $# -eq 2 ]; then 
	 copy_file "$1" "$2"
 else 
	 copy_files_to_directory "$@"
 fi


