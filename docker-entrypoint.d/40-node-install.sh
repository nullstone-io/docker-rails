#!/bin/sh

set -e

if [ "${NULLSTONE_ENV}" = "local" ]; then
  if [ -f "yarn.lock" ]; then
      echo "Installing yarn dependencies..."
      yarn install
  fi
  if [ -f "package-lock.json" ]; then
      echo "Installing npm dependencies..."
      npm install
  fi
else
  echo "Skipping node install (not a local environment)"
fi