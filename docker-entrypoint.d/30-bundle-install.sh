#!/bin/sh

set -e

if [ "${NULLSTONE_ENV}" = "local" ]; then
  echo "Verifying and installing gems..."
  bundle check || bundle install
else
  echo "Skipping bundle install (not a local environment)"
fi
