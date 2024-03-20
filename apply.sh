#!/bin/bash

set -ex

echo 'Installing XCode CLI Tools'
xcode-select --install || echo 'XCode CLI Tools are already installed'

if which -s brew; then
    echo 'Homebrew is already installed'
else
    echo 'Installing Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/dschmidt/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo 'Installing Applications'
if [ -z "${SKIP_HOMEBREW}" ]; then
    brew bundle install
fi

if [ -d "$HOME/.local/share/omf" ]; then
    echo 'Oh-My-Fish is already installed'
else
    echo 'Installing Oh-My-Fish'
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi


echo 'Running Ansible'
sudo ansible-playbook -i inventory base.yml

# echo "Install rust"
# rustup-init -y

# TODO: OMF installation
# curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "Install fish plugins & themes"
fish -c "omf install"

# Use fish as default shell
echo "Use fish as default shell"
chsh -s /usr/local/bin/fish

echo "Setting finder preferences"
# Show all files
defaults write com.apple.finder AppleShowAllFiles YES

# Open text files with VSCode
duti -s dev.zed.Zed-Preview public.json all
duti -s dev.zed.Zed-Preview public.plain-text all
duti -s dev.zed.Zed-Preview public.python-script all
duti -s dev.zed.Zed-Preview public.shell-script all
duti -s dev.zed.Zed-Preview public.source-code all
duti -s dev.zed.Zed-Preview public.text all
duti -s dev.zed.Zed-Preview public.unix-executable all
# this works for files without a filename extension
duti -s dev.zed.Zed-Preview public.data all

duti -s dev.zed.Zed-Preview .c all
duti -s dev.zed.Zed-Preview .cpp all
duti -s dev.zed.Zed-Preview .cs all
duti -s dev.zed.Zed-Preview .css all
duti -s dev.zed.Zed-Preview .go all
duti -s dev.zed.Zed-Preview .java all
duti -s dev.zed.Zed-Preview .js all
duti -s dev.zed.Zed-Preview .sass all
duti -s dev.zed.Zed-Preview .scss all
duti -s dev.zed.Zed-Preview .less all
duti -s dev.zed.Zed-Preview .vue all
duti -s dev.zed.Zed-Preview .cfg all
duti -s dev.zed.Zed-Preview .json all
duti -s dev.zed.Zed-Preview .jsx all
duti -s dev.zed.Zed-Preview .log all
duti -s dev.zed.Zed-Preview .lua all
duti -s dev.zed.Zed-Preview .md all
duti -s dev.zed.Zed-Preview .php all
duti -s dev.zed.Zed-Preview .pl all
duti -s dev.zed.Zed-Preview .py all
duti -s dev.zed.Zed-Preview .rb all
duti -s dev.zed.Zed-Preview .ts all
duti -s dev.zed.Zed-Preview .tsx all
duti -s dev.zed.Zed-Preview .txt all
duti -s dev.zed.Zed-Preview .conf all
duti -s dev.zed.Zed-Preview .yaml all
duti -s dev.zed.Zed-Preview .yml all
duti -s dev.zed.Zed-Preview .toml all

killall Finder

echo "Setup node"

# Check if stdout of n ls is empty
# If it is, install node
if [ -z "$(fish -c "n ls")" ]; then
    echo "Installing node"
    fish -c "n 16.20.2"
    fish -c "n lts"
fi
