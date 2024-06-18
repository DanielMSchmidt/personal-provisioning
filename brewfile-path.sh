#!/bin/bash
set -ex

# Helper to get the name of the brewfile (shared between save and apply)
PROJECT_DIR=$(cd $(dirname $0); pwd)
echo "$PROJECT_DIR/Brewfile-$HOSTNAME"
