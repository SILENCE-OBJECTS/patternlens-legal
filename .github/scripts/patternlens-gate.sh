#!/usr/bin/env bash
set -euo pipefail
[[ "${1:?}" == legal ]]; test -n "$(find . -iname '*privacy*' -type f -print -quit)" || { echo 'BLOCK missing privacy document'; exit 1; }
if grep -RInE 'diagnos(e|is)|treat(ment|s)?|emotion recognition|sentiment analysis' . --include='*.md' --include='*.txt' --exclude-dir=.git; then echo 'BLOCK S11'; exit 1; fi
echo 'PASS legal gate'
