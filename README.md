# System Update Automation Script

This Bash script automates system updates using **Homebrew** and logs the process. It also sends an email notification using **AWS SES** upon completion.

## Features
- Checks if **Homebrew** is installed and updates system packages.
- Logs the update process to a file (`system_update.log`).
- Sends an email notification upon success or failure using **AWS SES**.
- Handles errors and logs all activities.

## Prerequisites
Before running this script, ensure you have the following installed and configured:

1. **Homebrew** installed on your system ([Install Homebrew](https://brew.sh/)).
2. **AWS CLI** installed and configured with valid credentials ([AWS CLI Installation](https://aws.amazon.com/cli/)).
3. An **AWS SES verified sender email** to send email notifications.
4. **Crontab** (optional) for scheduling the script.

## Installation & Usage

### 1. Clone this repository
```sh
git clone <your-repo-url>
cd <your-repo-name>
```

### 2. Make the script executable
```sh
chmod +x /Users/macbook/GIT/update_script.sh
```

### 3. Run the script manually
```sh
/Users/macbook/GIT/update_script.sh
```

### 4. Automate with Crontab
Open crontab:
```sh
crontab -e
```

Add this line to run it daily at midnight:
```plaintext
0 0 * * * /Users/macbook/GIT/update_script.sh
```

### Logging
Logs are saved in:
```plaintext
$HOME/system_update.log
```