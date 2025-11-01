#!/usr/bin/env bash
set -euo pipefail

grep -qxF "alias ll='ls -la'" "$HOME/.bashrc" || printf '%s\n' "alias llz='ls -la'" >> "$HOME/.bashrc"

source "$HOME/.bashrc"