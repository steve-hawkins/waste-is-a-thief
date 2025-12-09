#!/bin/bash
set -e

apt-get update && apt-get install -y curl

# Install NVM and Gemini CLI
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source "$NVM_DIR/nvm.sh"
nvm install --lts
nvm alias default node
npm install -g @google/gemini-cli

# Install Jekyll dependencies
cd docs
bundle install
