#!/bin/bash

set -ex

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

if which -s brew; then
    echo 'Homebrew is already installed'
else
    echo 'Installing Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Installing Applications'
brew bundle install

echo 'Installing Ansible Requirements'
# ansible-galaxy install -r $ROOT/requirements.yaml

echo 'Running Ansible'
ansible-playbook -i "localhost," -c local base.yml

# echo "Install rust"
# rustup-init -y -t wasm32-unknown-unknown
# cargo install wasm-pack

echo "Install node"
mkdir -p ~/.nvm

echo "Install fish plugins & themes"
fish -c "omf install"

# Use fish as default shell
echo "Use fish as default shell"
chsh -s /usr/local/bin/fish

echo "Setting finder preferences"
# Show all files
defaults write com.apple.finder AppleShowAllFiles YES

# Open text files with VSCode
duti -s com.microsoft.VSCode public.json all
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.python-script all
duti -s com.microsoft.VSCode public.shell-script all
duti -s com.microsoft.VSCode public.source-code all
duti -s com.microsoft.VSCode public.text all
duti -s com.microsoft.VSCode public.unix-executable all
# this works for files without a filename extension
duti -s com.microsoft.VSCode public.data all

duti -s com.microsoft.VSCode .c all
duti -s com.microsoft.VSCode .cpp all
duti -s com.microsoft.VSCode .cs all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .go all
duti -s com.microsoft.VSCode .java all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .sass all
duti -s com.microsoft.VSCode .scss all
duti -s com.microsoft.VSCode .less all
duti -s com.microsoft.VSCode .vue all
duti -s com.microsoft.VSCode .cfg all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .log all
duti -s com.microsoft.VSCode .lua all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .php all
duti -s com.microsoft.VSCode .pl all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .rb all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .tsx all
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .conf all
duti -s com.microsoft.VSCode .yaml all
duti -s com.microsoft.VSCode .yml all
duti -s com.microsoft.VSCode .toml all

killall Finder


nvm install lts
nvm alias default lts
nvm use default