#!/bin/sh
#
# Lint staged files.

if ! make lint; then
	echo "Linting as failed."
	echo "You can run this locally with 'make lint'."
	exit 1
fi
