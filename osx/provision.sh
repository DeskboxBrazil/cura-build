#!/bin/sh
# This will be run in the guest machine as an unprivileged user,
# to prepare the environment.
sudo systemsetup -settimezone America/Sao_Paulo
brew update
brew install cmake python ssh-copy-id
brew cask update
brew cask install sshfs

mkdir -p /Users/vagrant/build
