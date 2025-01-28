#!/usr/bin/env bash

# Label: Check Gem Dependencies
# Description: Check Gemfile/gemspec dependencies for specified gem.
# Parameters: $1 (required): The gem name.
_check_gem_dependencies() {
  local gem="$1"
  rg "(add.*dependency \"$gem\"|add.*dependency '$gem'|gem \"$gem\"|gem '$gem')" --max-depth 1 . > /dev/null
}
export -f _check_gem_dependencies

