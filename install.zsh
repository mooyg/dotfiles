#!/usr/bin/bash
#


sudo apt install zsh
# 1. Git Configuration

cp .gitignore ~/.gitignore_global  ## Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"

# 2. Install Oh-My-Zsh & custom aliases

ZSH=~/.oh-my-zsh

curl -L http://install.ohmyz.sh | sh

# Install ZSH ALIASES
cp oh-my-zsh/aliases ~/.aliases

# Install ZSH-AUTOSUGGESTIONS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# ZSH CONFIG
cp oh-my-zsh/zshrc ~/.zshrc

# Create projects directory
mkdir ~/projects


#INSTALL VS CODE EXTENSIONS 
 cat vscode/extensions | while read extension || [[ -n $extension ]]; do
  code-insiders --install-extension $extension --force

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


## Remove cloned dotfiles from system
if [ -d ~/dotfiles ]; then
  sudo rm -R ~/dotfiles
fi