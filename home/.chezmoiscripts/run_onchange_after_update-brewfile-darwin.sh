#!/bin/bash

# Keep ~/.Brewfile up-to-date.
brew bundle dump --describe --global --force
