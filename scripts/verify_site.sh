#!/bin/bash
set -e

# Default values
BASEURL=""

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --baseurl) BASEURL="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Navigate to the docs directory where the site source is
cd "$(dirname "$0")/../docs"

# Install dependencies
echo "Installing dependencies..."
bundle install

echo "Building the site..."
if [ -n "$BASEURL" ]; then
    echo "Using baseurl: $BASEURL"
    bundle exec jekyll build --baseurl "$BASEURL"
else
    bundle exec jekyll build
fi

echo "Checking links with html-proofer..."
bundle exec htmlproofer ./_site --disable-external

echo "Verification complete!"
