#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is not installed. Please install Ruby/Bundler first."
  exit 1
fi

if [ ! -d "vendor/bundle" ]; then
  echo "Missing local gems. Run: bundle install --path vendor/bundle"
  exit 1
fi

echo "Starting local Jekyll preview at http://localhost:4000"
exec bundle exec jekyll serve -l -H localhost
