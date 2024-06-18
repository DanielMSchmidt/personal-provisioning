#!/bin/bash
set -ex

PROJECT_DIR=$(cd $(dirname $0); pwd)

BREWFILE=$(bash $PROJECT_DIR/brewfile-path.sh)
brew bundle dump --all --cleanup --force --verbose  --file $BREWFILE --describe
