#!/usr/bin/bash

# Disable annoying message about kernel upgrade
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

# Initial updating of the software
sudo apt update
sudo apt upgrade -y

# Installing of some usual utilities
sudo apt install -y curl git vim wget ca-certificates apt-transport-https

# Install ZSH
sudo apt install zsh -y

# Set ZSH to be a default shell for the user
sudo usermod -s /usr/bin/zsh $USER

# Install Oh My Zsh
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Download the p10k config file
curl -fsSLo ~/.p10k.zsh https://raw.githubusercontent.com/tbosnjak/bootstrap-working-environment/main/.p10k.zsh
                        
chown $(id -nu):$(id -ng) ~/.p10k.zsh && chmod 0664 ~/.p10k.zsh

# Download the zshrc dot file
curl -fsSLo ~/.zshrc https://raw.githubusercontent.com/tbosnjak/bootstrap-working-environment/main/.zshrc

chown $(id -nu):$(id -ng) ~/.zshrc && chmod 0644 ~/.zshrc
