#!/bin/bash

set -ex

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/" && pwd)"
DIRECTORY="$(cd $ROOT/../roles || echo '' && pwd)"
if [ -d "$DIRECTORY" ]; then
    echo 'Got roles repo'
else
    echo 'Cloning roles'
    git clone git@github.com:personal-provisioning/roles.git $ROOT/../roles
fi
pushd ../roles
git remote add ds git@github.com:DanielMSchmidt/roles.git || echo "DS remote already installed"
git fetch ds
git checkout ds/all-extensions -b all-extensions || echo "branch hopefully already exists"
git pull --rebase
popd

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

export PATH=$PATH:/opt/homebrew/bin
if which -s brew; then
    echo 'Homebrew is already installed'
else
    echo 'Installing Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

XCODE_VERSION=`xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/'`
ACCEPTED_LICENSE_VERSION=`defaults read /Library/Preferences/com.apple.dt.Xcode 2> /dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2`

if [ "$XCODE_VERSION" = "$ACCEPTED_LICENSE_VERSION" ]; then 
  echo "License was already accepted"
else
  sudo xcodebuild -license accept
fi

echo 'Installing Applications'
brew bundle install

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

echo "Setting up vscode extensions"
./syncVsCodeExtensions.sh

echo "Install fish plugins & themes"
fish -c "omf install"

echo "Setting finder preferences"
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
