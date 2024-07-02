#!/bin/bash

# Define colors for terminal output (Linux compatible)
cyan='\033[0;36m'
lightgreen='\033[1;32m'
yellow='\033[1;33m'
red='\033[1;31m'
reset='\033[0m' # Reset color

# Function to clear the screen
clear_screen() {
    echo -e "${cyan}Clearing screen...${reset}"
    clear
}

# Function to display a message with specified color
show_message() {
    local message="$1"
    local color="$2"
    echo -e "${color}${message}${reset}"
}

# Main script starts here

clear_screen

# Display banner and author information
show_message "Security Help For Ethical Hackers..." "$lightgreen"
echo -e "\n"
show_message "-Sutariya Parixit" "$yellow"
echo -e "\n"

# Prompt user for banner and cowsay name
read -p "$(echo -e "${yellow}What is Your Banner Name: ${reset}")" varbanner
echo -e "\n"
read -p "$(echo -e "${yellow}What is Your Cowsay Name: ${reset}")" varcowsay
echo -e "\n"

# Generate commands for banner and cowsay
banner_command="figlet -f big '${varbanner}' | lolcat"
cowsay_command="cowsay -f eyes '${varcowsay}' | lolcat"

# Store commands in temporary files
echo "${banner_command}" > banner_command.txt
echo "${cowsay_command}" > cowsay_command.txt

# Append commands to bashrc for persistent setup
echo -e "${cyan}Adding custom commands to ~/.bashrc...${reset}"
{
    echo "clear"
    cat banner_command.txt
    cat cowsay_command.txt
} >> ~/.bashrc

echo -e "${lightgreen}Setup complete! Restart your terminal to see your custom banner.${reset}"

# Clean up temporary files
rm banner_command.txt
rm cowsay_command.txt

# End of script

