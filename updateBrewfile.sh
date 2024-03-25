#!/bin/bash
set -ex

brew bundle dump --all --cleanup --force --verbose  --file ./Brewfile --describe
