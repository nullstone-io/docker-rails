#!/bin/sh

set -ex

if [ "${NULLSTONE_ENV}" = "local" ]; then
  echo "Installing bundler..."
  gem install bundler

  echo "Verifying and installing gems..."
  bundle check || bundle install
else
  echo "Skipping bundle install (not a local environment)"
fi
