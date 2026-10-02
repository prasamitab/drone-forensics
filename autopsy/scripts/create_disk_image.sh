#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-infected_disk.dd}"
IMAGE_SIZE_MB="${2:-50}"

echo "Creating ${IMAGE_SIZE_MB} MB raw image: ${IMAGE_NAME}"
dd if=/dev/zero of="${IMAGE_NAME}" bs=1m count="${IMAGE_SIZE_MB}"

echo "Image created:"
ls -lh "${IMAGE_NAME}"

