#!/bin/sh

set -ex

echo "Removing pid file"
rm -f "${PIDFILE}"
