#!/usr/bin/env bash

# This script sets up a GitHub SSH environment.
# It should be run in the Pop!_OS (or Ubuntu/Debian) GNOME terminal emulator.
# It installs git, generates an ed25519 SSH key pair, adds the key to the ssh-agent,
# prints the locations of the generated files, and copies the public key to the clipboard.

# Ensure script is not run as root
if [[ $EUID -eq 0 ]]; then
   echo "Please run this script as a regular user with sudo privileges, not as root."
   exit 1
fi

# Handle script args
if [[ ! $(($#)) = 2 ]] || [[ $1 =~ ^((-[hH])|(--[hH][eEaA][lL][pP]))$ ]] ; then
    echo "Usage: $0 \"email@address.com\" \"your-computers-name\""
    exit 1
fi

email=$1;
computerName=$2

# Detect if the system is Debian-based
if [[ -f /etc/debian_version ]]; then
    # Install git if not already installed
    if ! command -v git &> /dev/null; then
        sudo apt-get update
        sudo apt-get install git -y
    fi

    # Install xclip if not already installed
    if ! command -v xclip &> /dev/null; then
        sudo apt-get install xclip -y
    fi

    # Install keychain if not already installed
    if ! command -v keychain &> /dev/null; then
        sudo apt-get install keychain -y
    fi

    # Append keychain initialization command to ~/.bashrc if not already present
    if ! grep -q "keychain --eval" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# Start Keychain and add your SSH key" >> ~/.bashrc
        echo "eval \$(keychain --eval --agents ssh id_ed25519)" >> ~/.bashrc
        echo "" >> ~/.bashrc
    fi
else
    echo "This script only supports Debian-based systems."
    exit 1
fi

# Check for existing SSH keys and confirm before overwriting
if [ -f "${HOME}/.ssh/id_ed25519" ]; then
    echo "An SSH key already exists. Overwrite? (y/N)"
    read -r overwrite
    if [[ $overwrite =~ ^[Yy]$ ]]; then
        ssh-keygen -t ed25519 -C "$email" -f "${HOME}/.ssh/id_ed25519"
    else
        echo "Skipping key generation."
    fi
else
    ssh-keygen -t ed25519 -C "$email" -f "${HOME}/.ssh/id_ed25519"
fi

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add SSH private key to the ssh-agent
ssh-add "${HOME}/.ssh/id_ed25519"

# Print the location of the key pair
echo "SSH key pair located at:"
echo "Private key: ${HOME}/.ssh/id_ed25519"
echo "Public key: ${HOME}/.ssh/id_ed25519.pub"

# Print the public key to the terminal
echo "Your public SSH key is:"
cat "${HOME}/.ssh/id_ed25519.pub"

# Copy the public key to the clipboard
if command -v xclip &> /dev/null; then
    cat "${HOME}/.ssh/id_ed25519.pub" | tr -d '\n' | xclip -selection clipboard
    echo
    echo "The public key has been copied to the clipboard."
    echo
else
    echo "xclip not found. Please manually copy the public key:"
    echo "  ---->  ${HOME}/.ssh/id_ed25519.pub"
    echo
fi

# Attempt to open the GitHub SSH keys settings page in the default web browser
if command -v xdg-open &> /dev/null; then
    echo "Attempting to open the GitHub SSH keys settings page in your default browser..."
    xdg-open "https://github.com/settings/keys" &>/dev/null
    if [[ $? -ne 0 ]]; then
        echo "Failed to open the URL with xdg-open."
    fi
else
    echo "xdg-open not found. Please open https://github.com/settings/keys manually in your browser."
    echo "Attempting to open with explorer (check for WSL not added)"
    # TODO: only do this if WSL detected. 
    explorer.exe https://github.com/settings/keys
fi

# Set up Git configuration
git config --global user.email "$email"
git config --global user.name "$computerName"
git config --global push.default simple

# Display current Git configuration for verification
echo
echo ">>> Git Configuration:"
echo
git config --list
echo

# End of script
echo "SSH key setup and Git configuration have been completed."

