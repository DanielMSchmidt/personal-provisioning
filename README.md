# Personal Provisioning

I like to have my computer set up automatically, so that I can have a consistent setup through different machines.

## New Computer, who this?

### Before you start

- Create a new SSH key and get it into GitHub before running the script.
- Load the GPG keys from 1Password and [import them](https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine).
- Get your Dockerhub username and password and put it in `cp ./dotfiles/.config/fish/conf.d/_docker.fish.copy ./dotfiles/.config/fish/conf.d/docker.fish && vi ./dotfiles/.config/fish/conf.d/docker.fish`

### Running
Run `apply.sh` to start the provisioning

### Manual steps

- Open all the apps and log in
- Get node installed
```sh
nvm install 14.15.4
nvm alias default 14.15.4
nvm use default
```

## Save current state

- `updateBrewfile.sh`: updates brew, brew cask, and App Store dependencies
- `updateVsCodeExtensions.sh`: updates the saved vscode extensions
