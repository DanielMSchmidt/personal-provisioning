#!/bin/bash

set -ex

DIRECTORY="$(cd ../roles || echo '' && pwd)"
if [ -d "$DIRECTORY" ]; then
    echo 'Got roles repo'
else
    echo 'Cloning roles'
    git clone git@github.com:personal-provisioning/roles.git ../roles
fi
pushd ../roles
git remote add ds git@github.com:DanielMSchmidt/roles.git || echo "DS remote already installed"
git fetch ds
git checkout ds/all-extensions -b all-extensions || echo "branch hopefully already exists"
git pull --rebase
popd

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

if which -s brew; then
    echo 'Homebrew is already installed'
else
    echo 'Installing Homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing Applications'
brew bundle install

echo 'Running Ansible'
ansible-playbook -i "localhost," -c local base.yml

echo 'Uninstalling unneeded applications'
brew bundle cleanup --force

echo "Install rust"
rustup-init -y -t wasm32-unknown-unknown

echo "Setting up vscode extensions"
./syncVsCodeExtensions.sh

echo "Install fish plugins & themes"
fish -c "omf install"
