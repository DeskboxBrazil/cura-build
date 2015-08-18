#!/bin/sh
# This will be run in the guest machine as the vagrant user,
# to prepare the build environment.
set -e

sudo systemsetup -settimezone America/Sao_Paulo
brew update
brew install cmake doxygen gettext homebrew/dupes/zlib openssl qt5 wget
brew link --force gettext
brew link --force homebrew/dupes/zlib
brew link --force openssl
brew link --force qt5
brew cask update
brew cask install sshfs
# DMGBuild
sudo easy_install pip
sudo pip install dmgbuild

# Mount points
sudo mkdir -p /vagrant
sudo chown vagrant /vagrant
mkdir -p /Users/vagrant/build

# Utilities (not needed to build)
brew install ssh-copy-id

# ZSH
brew install zsh
git clone https://github.com/zsh-users/antigen.git ~/.antigen
echo '
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle nojhan/liquidprompt
antigen apply
' > ~/.zshrc
sudo chsh -s $(which zsh) vagrant
