Terminal Banner

This Bash script automates the installation of essential utilities and gems on various Linux distributions. It detects the package manager available on the system (apt, pacman, dnf, or yum) and performs necessary updates and installations accordingly.
Features

    Updates package lists and upgrades installed packages.
    Installs utilities: figlet, toilet, cowsay, nano, ruby.
    Installs the lolcat gem for colorful terminal output.
    Displays a completion message using ASCII art and lolcat.
    Provides instructions to run another script (install.sh) after installation.

Supported Package Managers

    apt (Debian, Ubuntu)
    pacman (Arch Linux)
    dnf (Fedora)
    yum (CentOS, Red Hat Enterprise Linux)

Usage

    Clone the repository:

    bash

git clone https://github.com/ehsan42315/Terminal_Banner.git
cd Terminal_Banner

Make the script executable:

bash

chmod +x install.sh

Run the script:

bash

    ./install.sh

    This will automatically detect your package manager and proceed with updating, upgrading, and installing the necessary packages and gems.

    Follow the instructions:

    After the script completes, it will display a message indicating that the installation is complete. Follow any additional instructions provided, such as running bash t-ban.sh.

Developer
Muhammad Ehsan
    
