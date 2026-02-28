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

| Plugin | Description | Advisors |
|--------|-------------|----------|
| `cio` | CTO Advisory Board for technical decision-making | 4 core + 3 specialists |
| `legal-advisory` | Legal counsel for business decisions | 4 core + 4 specialists |

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
3. Rebuilds `index.json`

## Repository Structure

```
├── index.json                    # Auto-generated plugin index
├── plugins/
│   ├── cio/                      # Each plugin in its own directory
│   │   ├── manifest.yaml
│   │   ├── personas/
│   │   ├── cognitive/
│   │   ├── prompts/
│   │   └── cio-1.0.0.tar.gz     # Auto-generated archive
│   ├── legal-advisory/
│   └── peluqueria/
├── scripts/
│   ├── build-index.sh            # Generates index.json + archives
│   └── validate-plugin.sh        # Validates plugin manifests
└── .github/workflows/
    ├── validate-plugin.yml       # PR validation
    └── build-index.yml           # Index rebuild on merge
```

## License

MIT
