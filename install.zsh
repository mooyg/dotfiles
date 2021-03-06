#!/usr/bin/bash
#


sudo apt install zsh



# 1. Git Configuration

cp .gitignore ~/.gitignore_global  ## Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"
cp git/.gitconfig ~/.gitconfig

# 2. Install Oh-My-Zsh & custom aliases

ZSH=$HOME/.oh-my-zsh

curl -L http://install.ohmyz.sh | sh


# Install ZSH ALIASES
cp oh-my-zsh/aliases ~/.aliases

# Install ZSH-AUTOSUGGESTIONS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# ZSH CONFIG
cp oh-my-zsh/zshrc ~/.zshrc

# Create projects directory
mkdir $HOME/projects  

# Install VS Code 
sudo snap install code-insiders

#INSTALL VS CODE EXTENSIONS 
cat vscode/extensions | while read extension; do 
code-insiders --install-extension $extension --force
done

# Install Volta

if test ! $(which volta); then
  echo "Installing volta"
  curl https://get.volta.sh | bash
  sleep 1
  volta install node@latest

else 
    echo "VOLTA ALREADY INSTALLED"
fi

## Print installed node, npm version
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

## Install Postgres 
sudo apt update
sudo apt install postgresql postgresql-contrib

## Remove cloned dotfiles from system
if [ -d ~/dotfiles ]; then
  sudo rm -R ~/dotfiles
fi


chsh -s $(which zsh)