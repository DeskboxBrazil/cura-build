#!/bin/sh
# This will be run in the guest machine as the vagrant user,
# to prepare the build environment.

set -e

sudo systemsetup -settimezone America/Sao_Paulo

# The box we are using has homebrew already installed.
brew update
brew install cmake doxygen gettext homebrew/dupes/zlib openssl qt5 wget
brew link --force gettext
brew link --force homebrew/dupes/zlib
brew link --force openssl
brew link --force qt5

# DMGBuild
sudo easy_install pip
sudo pip install dmgbuild
