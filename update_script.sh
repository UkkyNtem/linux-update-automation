#!/bin/bash

LOG_FILE="$HOME/system_update.log"
EMAIL="ukementem32@gmail.com"  #  recipient email

# Set PATH to include directories for brew and aws
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin"

{
    echo "Starting system update..." >> "$LOG_FILE"
    if command -v brew &> /dev/null; then
        brew update && brew upgrade
        echo "System update completed." >> "$LOG_FILE"
    else
        echo "Homebrew is not installed. Please install Homebrew first." >> "$LOG_FILE"
    fi
} >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    SUBJECT="System Update Successful"
    MESSAGE="System update completed successfully."
else
    SUBJECT="System Update Failed"
    MESSAGE="System update failed. Check logs: $LOG_FILE"
fi

# Log the email sending attempt
echo "Sending email to $EMAIL..." >> "$LOG_FILE"

# Send email using AWS SES
if command -v aws &> /dev/null; then
    aws ses send-email \
        --from "ukementem32@gmail.com" \
        --destination "ToAddresses=$EMAIL" \
        --message "Subject={Data='$SUBJECT'},Body={Text={Data='$MESSAGE',Charset='UTF-8'}}" \
        >> "$LOG_FILE" 2>&1

    # Check if the email was sent successfully
    if [ $? -eq 0 ]; then
        echo "Email sent successfully." >> "$LOG_FILE"
    else
        echo "Failed to send email." >> "$LOG_FILE"
    fi
else
    echo "AWS CLI is not installed. Please install AWS CLI first." >> "$LOG_FILE"
fi
