#!/bin/bash

echo "################################################################"
echo "----------------------------------------------------------------"
echo "-----------------------[ CONFIGURE SYSTEM ]---------------------"
echo "----------------------------------------------------------------"
echo "################################################################"
echo "User: " $USER
lsb_release -a

# Update and install SO

echo "----------------------------------------------------------------"
echo "--------------------------[ Update SO ]-------------------------"
echo "----------------------------------------------------------------"

sudo apt-get update && sudo apt-get upgrade -y
sudo apt install ubuntu-restricted-extras -y

# Install packages

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt install unrar -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install zsh -y 
sudo apt-get install insomnia -y
sudo apt install gnome-tweak-tool -y
sudo apt install font-manager -y
sudo apt install flatpak -y
sudo apt-get install -y caffeine -y
sudo apt install gnome-shell-extensions -y


# Install terminal

echo "----------------------------------------------------------------"
echo "--------------------[ Install Terminal ]------------------------"
echo "----------------------------------------------------------------"


sudo apt install zsh -y
sudo usermod -s /bin/zsh $USER

echo 'Install Oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'Instalar o tema Spaceship'
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

echo 'Create link to theme'
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo 'Install plugins'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo 'Auto Suggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo 'Syntax Highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo 'Create configuration file to terminal'
touch ~/.zshrc
cp zshrc ~/.zshrc 
source ~/.zshrc

sudo apt-get install -y tilix
sudo update-alternatives --config x-terminal-emulator

# Install Dev Tools

echo "----------------------------------------------------------------"
echo "---------------[ Install Java Development Kit ]-----------------"
echo "----------------------------------------------------------------"

sudo apt install openjdk-17-jdk -y 
java -version

sudo apt install maven -y
mvn -version

echo "----------------------------------------------------------------"
echo "----------------------[ Install Node ]--------------------------"
echo "----------------------------------------------------------------"

echo 'Set nvm enviroment variable'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "Install Node LTS version"
nvm install --lts 
nvm alias default node 

npm install -g yarn
echo 'NodeJs version'
node -v
echo 'Npm version'
npm -v
echo 'Yarn version'
yarn -v

# Install Snap Packages

echo "----------------------------------------------------------------"
echo "-----------------[ Install Snap Packages ]----------------------"
echo "----------------------------------------------------------------"

echo "Visual Studio Code"

sudo snap install code --classic

echo 'Dbeaver Community Edition'
sudo snap install dbeaver-ce

echo 'Done!'

echo 'Your computer will restart in 10 seconds, press [ Ctrl + C ] to cancel this operation and restart later.'
sleep 10
echo 'Restarting system...'
sudo reboot