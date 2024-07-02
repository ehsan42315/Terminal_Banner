#!/bin/bash

# Function to remove the Termux-Banner directory if it exists
folder_remove() {
    local banner_dir="$HOME/Termux-Banner"
    
    if [[ -d "$banner_dir" ]]; then
        echo "Removing $banner_dir..."
        rm -rvf "$banner_dir"
    else
        echo "$banner_dir not found, nothing to remove."
    fi
}

# Function to install/update Linux configuration files (zshrc and bashrc)
install() {
    local zshrc_file="$HOME/.zshrc"
    local bashrc_file="$HOME/.bashrc"

    # Define the command_not_found_handle function if command-not-found script exists
    if [[ -x "/usr/lib/command-not-found" ]]; then
        echo "Setting command_not_found_handle function in configuration files..."

        # Update .zshrc
        {
            echo "if [ -x /usr/lib/command-not-found ]; then"
            echo "    command_not_found_handle() {"
            echo "        /usr/lib/command-not-found \"\$1\""
            echo "    }"
            echo "fi"
            echo "PS1='\$ '"
        } > "$zshrc_file"

        # Update .bashrc
        {
            echo "if [ -x /usr/lib/command-not-found ]; then"
            echo "    command_not_found_handle() {"
            echo "        /usr/lib/command-not-found \"\$1\""
            echo "    }"
            echo "fi"
            echo "PS1='\$ '"
        } > "$bashrc_file"

        echo "Configuration files updated."
    else
        echo "Command not found script (/usr/lib/command-not-found) not executable or not found."
        echo "Configuration files not updated."
    fi
}

# Execute functions
folder_remove
install

