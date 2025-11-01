#!/usr/bin/env bash
set -euo pipefail

: "${1:?Использование: $0 /путь/к/директории}"
absdir=$(readlink -f -- "$1" 2>/dev/null || echo "$1")

export PATH="$PATH:$absdir"
touch "$HOME/.bashrc"
printf '\nexport PATH="$PATH:%s"\n' "$absdir" >> "$HOME/.bashrc"