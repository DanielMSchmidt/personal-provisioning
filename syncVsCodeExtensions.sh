#!/bin/bash
set -e

installed_extensions=$(code --list-extensions)

while read -r installed_extension; do
  # check if the extension should be installed
    if grep -Fxq "$installed_extension" VsCodeExtensions; then
        echo "keeping $installed_extension"
    else
        code --uninstall-extension="$installed_extension"
    fi
    
done < <(echo "$installed_extensions")

while read -r desired_extension; do
    if [[ "$installed_extensions" == *"$desired_extension"* ]]; then
    echo "already got $desired_extension"
    else
        code --install-extension="$desired_extension"
    fi
done <VsCodeExtensions
