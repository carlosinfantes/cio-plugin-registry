#!/usr/bin/env bash
# build-index.sh — Reads all plugins/*/manifest.yaml and generates:
#   1. A tar.gz archive per plugin  (plugins/<domain>/<domain>-<version>.tar.gz)
#   2. A root index.json            (index.json)
#
# Usage:  ./scripts/build-index.sh
# Requires: yq (https://github.com/mikefarah/yq) and jq

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGINS_DIR="$REPO_ROOT/plugins"
INDEX_FILE="$REPO_ROOT/index.json"
DOWNLOADS_FILE="$REPO_ROOT/downloads.json"

# ---------------------------------------------------------------------------
# Preflight
# ---------------------------------------------------------------------------
for cmd in yq jq tar; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: '$cmd' is required but not installed." >&2
    exit 1
  fi
done

# ---------------------------------------------------------------------------
# Collect plugin entries
# ---------------------------------------------------------------------------
# Load persistent download counts
if [ -f "$DOWNLOADS_FILE" ]; then
  download_counts="$(cat "$DOWNLOADS_FILE")"
else
  download_counts='{"counts":{}}'
fi

entries="[]"

for manifest in "$PLUGINS_DIR"/*/manifest.yaml; do
  [ -f "$manifest" ] || continue

  plugin_dir="$(dirname "$manifest")"
  domain="$(yq -r '.domain' "$manifest")"
  version="$(yq -r '.version' "$manifest")"
  display_name="$(yq -r '.display_name' "$manifest")"
  description="$(yq -r '.description' "$manifest" | tr '\n' ' ' | sed 's/  */ /g' | sed 's/ *$//')"
  author="$(yq -r '.author // "Community"' "$manifest")"
  license="$(yq -r '.license // ""' "$manifest")"
  homepage="$(yq -r '.homepage // ""' "$manifest")"
  min_cli="$(yq -r '.min_cli_version // "1.0.0"' "$manifest")"
  core_count="$(yq -r '.core_advisors | length' "$manifest")"
  specialist_count="$(yq -r '.specialists | length' "$manifest")"

  # Extract keywords from decision domains
  keywords="$(yq -r '(.decision_domains // []) | join(",")' "$manifest")"

  # Detect category heuristically
  category="business"
  domains_str="$(yq -r '(.decision_domains // []) | join(" ")' "$manifest")"
  # Category detection — check manifest category field first, then heuristic
  manifest_category="$(yq -r '.category // ""' "$manifest")"
  if [ -n "$manifest_category" ]; then
    category="$manifest_category"
  elif echo "$domains_str" | grep -qiE "career_strategy|money_psychology|personal_brand|creative_process|habit|freelancing|holistic_wellness"; then
    category="personal"
  elif echo "$domains_str" | grep -qiE "financial_planning" && echo "$domains_str" | grep -qiE "investing|budgeting|retirement"; then
    category="personal"
  elif echo "$domains_str" | grep -qiE "legal|litigation|contract"; then
    category="legal"
  elif echo "$domains_str" | grep -qiE "health|medical|clinical"; then
    category="healthcare"
  elif echo "$domains_str" | grep -qiE "tech_strategy|engineer|architect|security_strategy|data_strategy|ml_engineer"; then
    category="technology"
  fi

  # -----------------------------------------------------------------------
  # Package the plugin as tar.gz
  # -----------------------------------------------------------------------
  archive_name="${domain}-${version}.tar.gz"
  archive_path="$plugin_dir/$archive_name"

  # Create tar.gz with files at the root (no domain/ prefix)
  # The CLI downloader already creates the domain subdirectory
  tar -czf "$archive_path" \
    -C "$plugin_dir" \
    --exclude="*.tar.gz" \
    --exclude=".DS_Store" \
    .

  archive_size="$(stat -f%z "$archive_path" 2>/dev/null || stat -c%s "$archive_path" 2>/dev/null)"

  # Checksum
  checksum="$(shasum -a 256 "$archive_path" | awk '{print $1}')"

  # Download URL (raw GitHub content)
  download_url="https://raw.githubusercontent.com/carlosinfantes/cio-plugin-registry/main/plugins/${domain}/${archive_name}"

  # -----------------------------------------------------------------------
  # Build JSON entry
  # -----------------------------------------------------------------------
  IFS=',' read -ra kw_array <<< "$keywords"
  kw_json="$(printf '%s\n' "${kw_array[@]}" | jq -R . | jq -s .)"

  # Look up persistent download count
  dl_count="$(echo "$download_counts" | jq -r --arg d "$domain" '.counts[$d] // 0')"

  entry="$(jq -n \
    --arg domain "$domain" \
    --arg display_name "$display_name" \
    --arg version "$version" \
    --arg description "$description" \
    --arg author "$author" \
    --arg license "$license" \
    --arg homepage "$homepage" \
    --arg download_url "$download_url" \
    --arg checksum "$checksum" \
    --argjson size "$archive_size" \
    --arg min_cli "$min_cli" \
    --arg category "$category" \
    --argjson keywords "$kw_json" \
    --argjson core_count "$core_count" \
    --argjson specialist_count "$specialist_count" \
    --argjson dl_count "$dl_count" \
    '{
      domain: $domain,
      display_name: $display_name,
      version: $version,
      description: $description,
      author: $author,
      license: $license,
      homepage: $homepage,
      download_url: $download_url,
      checksum: $checksum,
      size: $size,
      min_cli_version: $min_cli,
      category: $category,
      keywords: $keywords,
      featured: false,
      downloads: $dl_count,
      advisors: { core: $core_count, specialists: $specialist_count }
    }'
  )"

  entries="$(echo "$entries" | jq --argjson e "$entry" '. + [$e]')"

  echo "  Packaged: $domain v$version ($archive_name, $(( archive_size / 1024 ))KB)"
done

# ---------------------------------------------------------------------------
# Write index.json
# ---------------------------------------------------------------------------
now="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

jq -n \
  --arg version "1.0.0" \
  --arg updated "$now" \
  --argjson plugins "$entries" \
  '{
    registry_version: $version,
    last_updated: $updated,
    plugins: $plugins,
    categories: [
      { id: "technology", name: "Technology & Engineering", description: "Technical decision-making and engineering advisory" },
      { id: "legal", name: "Legal & Compliance", description: "Legal counsel, contracts, and compliance advisory" },
      { id: "healthcare", name: "Healthcare", description: "Medical and healthcare advisory" },
      { id: "business", name: "Business & Operations", description: "General business operations and specialty domains" },
      { id: "personal", name: "Personal & Life", description: "Personal advisory for life decisions, wellness, finances, and growth" }
    ]
  }' > "$INDEX_FILE"

plugin_count="$(echo "$entries" | jq 'length')"
echo ""
echo "index.json written with $plugin_count plugin(s)."
