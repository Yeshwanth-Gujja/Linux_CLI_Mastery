#!/usr/bin/env bash
set -Eeuo pipefail
mkdir -p pdf
cat notes/*.md > /tmp/linux-cli-master.md
pandoc /tmp/linux-cli-master.md -o pdf/Linux_CLI_Master_Notes.pdf --from=gfm --toc --number-sections
printf 'Created pdf/Linux_CLI_Master_Notes.pdf\n'
