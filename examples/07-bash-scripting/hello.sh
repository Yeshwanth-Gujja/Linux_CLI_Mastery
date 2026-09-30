#!/usr/bin/env bash
set -Eeuo pipefail

name=${1:-World}
printf 'Hello, %s\n' "$name"
