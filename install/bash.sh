#!/bin/sh
set -e

if [ "$SHELL" != "/usr/local/bin/bash" ]; then
  chsh -s /usr/local/bin/bash
else
  echo "NO NEED TO CHANGE SHELL"
fi
