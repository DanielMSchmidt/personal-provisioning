#!/bin/bash

set -ex

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

if which -s brew; then
    echo 'Homebrew is already installed'
else
    echo 'Installing Homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing Applications'
brew bundle install --cleanup

echo 'Installing Ansible Requirements'
# ansible-galaxy install -r $ROOT/requirements.yaml

echo 'Running Ansible'
ansible-playbook -i "localhost," -c local base.yml

echo 'Uninstalling unneeded applications'
brew bundle cleanup --force

# echo "Install rust"
# rustup-init -y -t wasm32-unknown-unknown
# cargo install wasm-pack

echo "Install node"
mkdir -p ~/.nvm

echo "Install fish plugins & themes"
fish -c "omf install"

echo "Setting finder preferences"
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder