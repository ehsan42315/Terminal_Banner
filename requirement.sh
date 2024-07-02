#!/bin/bash

# Clear the terminal screen
clear

# Function to update and upgrade packages based on package manager
update_upgrade() {
    local package_manager="$1"
    echo -e "\e[1m\e[32m[*] Updating package lists...\e[0m"
    case "$package_manager" in
        apt)
            apt update
            apt upgrade -y
            ;;
        pacman)
            pacman -Syu --noconfirm
            ;;
        dnf)
            dnf check-update
            dnf upgrade -y
            ;;
        yum)
            yum check-update
            yum upgrade -y
            ;;
        *)
            echo "Unsupported package manager: $package_manager"
            exit 1
            ;;
    esac
}

# Function to install packages based on package manager
install_packages() {
    local package_manager="$1"
    echo -e "\e[1m\e[32m[*] Installing figlet, toilet, cowsay, nano, and Ruby...\e[0m"
    case "$package_manager" in
        apt)
            apt install -y figlet toilet cowsay nano ruby
            ;;
        pacman)
            pacman -S --noconfirm figlet toilet cowsay nano ruby
            ;;
        dnf)
            dnf install -y figlet toilet cowsay nano ruby
            ;;
        yum)
            yum install -y figlet toilet cowsay nano ruby
            ;;
        *)
            echo "Unsupported package manager: $package_manager"
            exit 1
            ;;
    esac
}

# Update package lists and upgrade installed packages
if [ -x "$(command -v apt)" ]; then
    update_upgrade "apt"
elif [ -x "$(command -v pacman)" ]; then
    update_upgrade "pacman"
elif [ -x "$(command -v dnf)" ]; then
    update_upgrade "dnf"
elif [ -x "$(command -v yum)" ]; then
    update_upgrade "yum"
else
    echo "No supported package manager found."
    exit 1
fi

# Install necessary utilities for customization
if [ -x "$(command -v apt)" ]; then
    install_packages "apt"
elif [ -x "$(command -v pacman)" ]; then
    install_packages "pacman"
elif [ -x "$(command -v dnf)" ]; then
    install_packages "dnf"
elif [ -x "$(command -v yum)" ]; then
    install_packages "yum"
else
    echo "No supported package manager found."
    exit 1
fi

# Install lolcat gem for colorful output
echo -e "\e[1m\e[32m[*] Installing lolcat gem...\e[0m"
gem install lolcat

# Display completion message with ASCII art
echo ""
figlet -f big "Installation Complete!" | lolcat
echo ""
echo -e "\e[1m\e[32m[*] Now Run bash t-ban.sh to start!\e[0m"
echo ""
echo -e "\e[1m\e[32m[*] Developed by:\e[33m Muhammad Ehsan\e[0m"
echo ""

# End of script

