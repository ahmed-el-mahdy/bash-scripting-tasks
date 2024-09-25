#!/bin/bash

# Define the mail file path for the current user
mail_file="/var/mail/$(whoami)"

# Get the initial size of the mail file
if [ -f "$mail_file" ]; then
    initial_size=$(stat -c%s "$mail_file")
else
    initial_size=0
fi

echo "Monitoring new emails. Press [CTRL+C] to stop."

# Function to check for new mails
check_new_mail() {
    current_size=$(stat -c%s "$mail_file")
    
    if [ "$current_size" -gt "$initial_size" ]; then
        echo "You have new mail!"
        initial_size=$current_size
    fi
}

# Infinite loop to check for new mails every 10 seconds
while true; do
    if [ -f "$mail_file" ]; then
        check_new_mail
    else
        echo "Mail file not found for user $(whoami)."
        exit 1
    fi
    sleep 10
done

