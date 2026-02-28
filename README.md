# CIO Plugin Registry

The official plugin registry for [CIO](https://github.com/carlosinfantes/cio) — AI-powered advisory boards for intelligent decision-making.

## Using Plugins

```bash
# Search available plugins
cio plugin search

# Install a plugin
cio plugin install legal-advisory

# Activate it
cio plugin use legal-advisory

# See what's installed
cio plugin list
```

## Available Plugins

| Emoji | Plugin | Category | Description | Advisors |
|-------|--------|----------|-------------|----------|
| 🧠 | `cio` | Technology | CTO Advisory Board for technical decision-making | 4 core + 3 specialists |
| ⚖️ | `legal-advisory` | Legal | Legal counsel for business decisions | 4 core + 4 specialists |
| 📈 | `marketing-advisory` | Business | Marketing and brand strategy | 4 core + 3 specialists |
| 💰 | `financial-advisory` | Business | Financial planning and advisory | 4 core + 3 specialists |
| 🚀 | `startup-advisory` | Business | Startup-specific guidance | 4 core + 3 specialists |
| 🎨 | `creative-advisory` | Personal & Life | Advisory for creators, writers, and indie builders | 4 core + 3 specialists |
| 🤖 | `data-ai-advisory` | Technology | Data architecture and AI strategy | 4 core + 3 specialists |
| 📦 | `product-advisory` | Business | Product strategy and growth | 4 core + 3 specialists |
| 👥 | `people-advisory` | Business | HR, culture, and organizational development | 4 core + 3 specialists |
| 🔒 | `security-advisory` | Technology | Security and compliance | 4 core + 3 specialists |
| 💼 | `career-advisory` | Personal & Life | Career coaching, job search, and salary negotiation | 4 core + 3 specialists |
| 🧘 | `wellness-advisory` | Personal & Life | Health and wellness advisory | 4 core + 3 specialists |
| 💵 | `personal-finance` | Personal & Life | Personal investment and finance planning | 4 core + 3 specialists |

## Contributing

Want to create a plugin for your domain? See [CONTRIBUTING.md](CONTRIBUTING.md).

```bash
# Scaffold a new plugin
cio plugin create my-domain

# Copy it here
cp -r ~/.cio/plugins/custom/my-domain plugins/my-domain

# Validate and PR
./scripts/validate-plugin.sh plugins/my-domain
```

## How It Works

```
User runs: cio plugin install <domain>
            │
            ▼
CLI fetches: index.json (this repo, raw GitHub)
            │
            ▼
CLI downloads: plugins/<domain>/<domain>-<version>.tar.gz
            │
            ▼
Extracts to: ~/.cio/plugins/installed/<domain>/
```

When a PR is merged, GitHub Actions automatically:
1. Validates all manifests
2. Packages each plugin as `.tar.gz`
3. Rebuilds `index.json` with checksums, download counts, and metadata

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/build-index.sh` | Generates `index.json` and `.tar.gz` archives from manifests |
| `scripts/validate-plugin.sh` | Validates plugin manifests (single or `--all`) |
| `scripts/track-download.sh` | Increments download counter for a plugin domain |
| `scripts/rank-plugins.sh` | Displays plugins ranked by downloads (supports `--json`) |

## Repository Structure

```
├── index.json                    # Auto-generated plugin index
├── downloads.json                # Persistent download counters
├── plugins/
│   ├── cio/                      # Each plugin in its own directory
│   │   ├── manifest.yaml         #   Plugin metadata and advisor definitions
│   │   ├── settings.yaml         #   Default settings
│   │   ├── README.md             #   Plugin documentation
│   │   ├── personas/             #   Advisor personality definitions
│   │   │   ├── facilitator.yaml
│   │   │   ├── *.yaml            #   Core advisors
│   │   │   └── specialists/      #   Auto-summoned by keywords
│   │   ├── cognitive/            #   Discovery and panel state machines
│   │   ├── prompts/              #   Greeting and synthesis templates
│   │   └── cio-1.0.0.tar.gz     #   Auto-generated archive
│   ├── legal-advisory/
│   ├── marketing-advisory/
│   └── ...                       # 13 plugins total
├── scripts/
│   ├── build-index.sh
│   ├── validate-plugin.sh
│   ├── track-download.sh
│   └── rank-plugins.sh
└── .github/workflows/
    ├── validate-plugin.yml       # PR validation
    └── build-index.yml           # Index rebuild on merge
```

## License

MIT
