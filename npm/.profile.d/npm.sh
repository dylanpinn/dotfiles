#!/bin/sh

# Move npm config out of home directory.
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
