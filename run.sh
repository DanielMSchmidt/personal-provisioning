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
git checkout ds all-extensions
git fetch
git pull --rebase
popd

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

if which -s brew; then
    echo 'Updating Homebrew'
    brew update && brew upgrade && brew cleanup
else
    echo 'Installing Homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing Applications'
brew bundle install

echo 'Running Ansible'
ansible-playbook -i "localhost," -c local base.yml

echo 'Uninstalling unneeded applications'
brew bundle cleanup

echo "Install rust"
rustup-init -y -t wasm32-unknown-unknown
cargo instal