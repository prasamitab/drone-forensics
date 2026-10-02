#!/usr/bin/env bash
set -euo pipefail

INPUT_FILE="${1:?Usage: ./verify_hash.sh <file>}"

if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "${INPUT_FILE}"
else
    sha256sum "${INPUT_FILE}"
fi
