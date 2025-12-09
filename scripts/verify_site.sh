#!/bin/bash
set -e

# Navigate to the docs directory where the site source is
cd "$(dirname "$0")/../docs"

echo "Installing dependencies..."
bundle install

echo "Building the site..."
bundle exec jekyll build

echo "Checking links with html-proofer..."
bundle exec htmlproofer ./_site --disable-external

echo "Verification complete!"
