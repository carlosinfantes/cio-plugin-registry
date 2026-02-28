#!/usr/bin/env bash
# track-download.sh — Increment the download counter for a plugin domain
#
# Usage:  ./scripts/track-download.sh <domain>
# Example: ./scripts/track-download.sh cio

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DOWNLOADS_FILE="$REPO_ROOT/downloads.json"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <domain>" >&2
  exit 1
fi

domain="$1"

if ! command -v jq &>/dev/null; then
  echo "Error: 'jq' is required but not installed." >&2
  exit 1
fi

# Ensure downloads.json exists
if [ ! -f "$DOWNLOADS_FILE" ]; then
  echo '{"counts":{},"last_updated":""}' > "$DOWNLOADS_FILE"
fi

# Check domain exists in counts
current="$(jq -r --arg d "$domain" '.counts[$d] // "missing"' "$DOWNLOADS_FILE")"
if [ "$current" = "missing" ]; then
  echo "Warning: domain '$domain' not found in downloads.json — adding it." >&2
fi

# Increment count and update timestamp
now="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
jq --arg d "$domain" --arg ts "$now" '
  .counts[$d] = ((.counts[$d] // 0) + 1) |
  .last_updated = $ts
' "$DOWNLOADS_FILE" > "$DOWNLOADS_FILE.tmp" && mv "$DOWNLOADS_FILE.tmp" "$DOWNLOADS_FILE"

new_count="$(jq -r --arg d "$domain" '.counts[$d]' "$DOWNLOADS_FILE")"
echo "$domain: $new_count downloads"
