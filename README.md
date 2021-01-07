# Personal Provisioning

I like to have my computer set up automatically, so that I can have a consistent setup through different machines.

## New Computer, who this?

### Before you start

- Create a new SSH key and get it into GitHub before running the script.
- Load the GPG keys from 1Password and [import them](https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine).

### Running
Run `run.sh` to start the provisioning

### Manual steps

- Open all the apps and log in

## Save current state

- `updateBrewfile.sh`: updates brew, brew cask, and App Store dependencies
- `updateVsCodeExtensions.sh`: updates the saved vscode extensions
