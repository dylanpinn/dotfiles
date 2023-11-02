#!/usr/bin/env bash

cd "$(chezmoi source-path)" || exit

make
