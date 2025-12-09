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

# Skip bundle install in CI as it is handled by setup-ruby with caching
if [ "$CI" != "true" ]; then
    echo "Installing dependencies..."
    bundle install
fi

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
