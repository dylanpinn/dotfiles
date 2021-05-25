#!/bin/sh

# Move sbt and ivy data out of home directory.
alias sbt="sbt -ivy "$XDG_DATA_HOME"/ivy2 -sbt-dir "$XDG_DATA_HOME"/sbt"
