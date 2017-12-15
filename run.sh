#!/bin/bash

set -e

if [ -d "$DIRECTORY" ]; then
    echo 'Cloning roles'
    git clone git@github.com:personal-provisioning/roles.git ../roles
fi

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

which -s brew


if which -s brew
then
    echo 'Updating Homebrew'
    brew update --all && brew upgrade && brew cleanup
else
    echo 'Installing Homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing Ansible'
brew install ansible


echo 'Running Ansible'

ansible-playbook -i "localhost," -c local base.yml

