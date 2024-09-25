

# Define the path to the mail template
template_file="mtemplate"

# Check if the mail template file exists
if [ ! -f "$template_file" ]; then
    echo "Mail template file '$template_file' not found."
    exit 1
fi

# Read the subject from the user
read -p "Enter the email subject: " subject

# Get a list of all users in the system
users=$(cut -d: -f1 /etc/passwd)

# Loop through each user and send the email
for user in $users; do
    # Get the home directory of the user to check if the user is real
    home_dir=$(getent passwd "$user" | cut -d: -f6)
    
    # Skip system users without a home directory or with non-standard home directories
    if [ ! -d "$home_dir" ] || [[ "$home_dir" == /root ]] || [[ "$home_dir" == /nonexistent ]]; then
        continue
    fi
    
    # Send the email
    mail -s "$subject" "$user" < "$template_file"
    echo "Email sent to $user"
done

echo "All emails sent."

