#!/usr/bin/env bash
# rank-plugins.sh — Display plugins ranked by download count
#
# Usage:  ./scripts/rank-plugins.sh
#         ./scripts/rank-plugins.sh --json    (output as JSON array)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
INDEX_FILE="$REPO_ROOT/index.json"

if ! command -v jq &>/dev/null; then
  echo "Error: 'jq' is required but not installed." >&2
  exit 1
fi

if [ ! -f "$INDEX_FILE" ]; then
  echo "Error: index.json not found. Run build-index.sh first." >&2
  exit 1
fi

if [ "${1:-}" = "--json" ]; then
  jq '[.plugins | sort_by(-.downloads)[] | {rank: null, domain, display_name, downloads, category}] | to_entries | map(.value.rank = (.key + 1) | .value)' "$INDEX_FILE"
  exit 0
fi

echo ""
echo "Plugin Rankings by Downloads"
echo "============================"
echo ""
printf "%-4s %-25s %10s  %-15s\n" "#" "Domain" "Downloads" "Category"
printf "%-4s %-25s %10s  %-15s\n" "---" "-------------------------" "----------" "---------------"

jq -r '.plugins | sort_by(-.downloads) | to_entries[] | "\(.key + 1)|\(.value.domain)|\(.value.downloads)|\(.value.category)"' "$INDEX_FILE" | \
while IFS='|' read -r rank domain downloads category; do
  printf "%-4s %-25s %10s  %-15s\n" "$rank" "$domain" "$downloads" "$category"
done

echo ""
total="$(jq '[.plugins[].downloads] | add' "$INDEX_FILE")"
echo "Total downloads: $total"
