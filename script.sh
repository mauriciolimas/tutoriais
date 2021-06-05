#!/bin/bash

echo "Start Configurations"

echo "-----[ Update SO ]-----"
sudo apt-get update && sudo apt-get upgrade -y

echo "-----[ Update Media codecs ]-----"

sudo apt install ubuntu-restricted-extras


echo "-----[ Install Packages ]-----"
sudo apt install unrar -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install gnome-tweaks -y
sudo apt install zsh -y 
sudo apt install synapse -y
sudo apt-get install insomnia -y

echo "-----[ Configure Zsh with default terminal ]-----"
sudo usermod -s /bin/zsh $USER

echo "install Oh-my-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Install theme Spaceship"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
echo "Linking new theme"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "Install plugins"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo "-----[ Install development kit ]-----"

echo "Install NodeJs"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

cp template-zsh ~/.zshrc -y 

nvm nvm 14.16.0

echo "Install JDK"
sudo apt-get install default-jdk

echo 'Install Docker'
sudo curl -sSL https://get.docker.com | sh

echo "-----[ Install Snap Packages ]-----"

echo "Visual Studio Code"

sudo snap install code --classic -y

echo "Drawio"

sudo snap install drawio -y

echo "Android Studio"

sudo snap install android-studio --classic -y