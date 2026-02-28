#!/usr/bin/env bash
# validate-plugin.sh — Validates a plugin directory has a correct manifest.yaml
#
# Usage:  ./scripts/validate-plugin.sh plugins/<domain>
#         ./scripts/validate-plugin.sh --all
#
# Exit codes:  0 = valid, 1 = invalid

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
errors=0

validate_plugin() {
  local plugin_dir="$1"
  local manifest="$plugin_dir/manifest.yaml"
  local domain_dir
  domain_dir="$(basename "$plugin_dir")"

  if [ ! -f "$manifest" ]; then
    echo "FAIL  $domain_dir: missing manifest.yaml"
    ((errors++))
    return
  fi

  # Required fields
  for field in domain version display_name facilitator.name; do
    val="$(yq -r ".$field" "$manifest" 2>/dev/null)"
    if [ -z "$val" ] || [ "$val" = "null" ]; then
      echo "FAIL  $domain_dir: missing required field '$field'"
      ((errors++))
    fi
  done

  # Domain must match directory name
  manifest_domain="$(yq -r '.domain' "$manifest")"
  if [ "$manifest_domain" != "$domain_dir" ]; then
    echo "FAIL  $domain_dir: domain '$manifest_domain' does not match directory name"
    ((errors++))
    return
  fi

  # Must have at least one core advisor
  advisor_count="$(yq -r '.core_advisors | length' "$manifest")"
  if [ "$advisor_count" -lt 1 ]; then
    echo "FAIL  $domain_dir: must have at least 1 core advisor"
    ((errors++))
    return
  fi

  # Each advisor must have id, name, role
  for i in $(seq 0 $((advisor_count - 1))); do
    for field in id name role; do
      val="$(yq -r ".core_advisors[$i].$field" "$manifest")"
      if [ -z "$val" ] || [ "$val" = "null" ]; then
        echo "FAIL  $domain_dir: core_advisors[$i] missing '$field'"
        ((errors++))
      fi
    done
  done

  # Version must look like semver
  version="$(yq -r '.version' "$manifest")"
  if ! echo "$version" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+'; then
    echo "FAIL  $domain_dir: version '$version' is not valid semver"
    ((errors++))
    return
  fi

  # YAML must parse without errors (catch syntax issues)
  if ! yq '.' "$manifest" > /dev/null 2>&1; then
    echo "FAIL  $domain_dir: manifest.yaml has YAML syntax errors"
    ((errors++))
    return
  fi

  echo "OK    $domain_dir (v$version, $advisor_count advisors)"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

if [ "${1:-}" = "--all" ]; then
  echo "Validating all plugins..."
  echo ""
  for dir in "$REPO_ROOT"/plugins/*/; do
    [ -d "$dir" ] && validate_plugin "$dir"
  done
else
  if [ -z "${1:-}" ]; then
    echo "Usage: $0 plugins/<domain>  or  $0 --all" >&2
    exit 1
  fi
  validate_plugin "$1"
fi

echo ""
if [ "$errors" -gt 0 ]; then
  echo "$errors error(s) found."
  exit 1
else
  echo "All plugins valid."
fi
