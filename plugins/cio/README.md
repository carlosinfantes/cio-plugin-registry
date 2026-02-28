# CTO Advisory Board Plugin

AI-powered executive committee for CTOs making technical decisions.

## Overview

This plugin provides a panel of experienced technical advisors who help CTOs and engineering leaders make better decisions. It includes:

- **Facilitator**: Jordan guides discovery and problem articulation
- **Core Advisors**: CTO, CISO, VP Engineering, Principal Architect
- **Specialists**: CFO Lens, Product Strategy, Platform Engineering

## Installation

This plugin comes bundled with the CTO Advisory Board CLI. It's automatically loaded as the default domain.

To verify it's installed:

```bash
cto plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🎯 cto | Victoria Chen | Fractional CTO, 3x exit | Strategy, culture, build vs buy |
| 🛡️ ciso | Marcus Webb | Former CISO, Fortune 500 | Security, compliance, risk |
| ⚡ vp-eng | Priya Sharma | VP Engineering | Team, delivery, execution |
| 🏗️ architect | Erik Lindqvist | Principal Architect | Systems, scalability, patterns |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 💰 cfo | David Park | CFO Lens | budget, cost, roi, pricing |
| 📱 product | Sarah Mitchell | Product Strategy | feature, customers, mvp, roadmap |
| 🔧 devops | Alex Petrov | Platform Engineering | kubernetes, deploy, aws, docker |

## Interaction Modes

### Discovery Mode (Default)
Jordan facilitates problem articulation before bringing in the panel.

```bash
cto
# Jordan will guide you through discovery
```

### Panel Mode
Get perspectives from multiple advisors at once.

```bash
cto ask --mode panel "Should we build or buy our auth system?"
```

### Framework Mode
Structured decision framework with criteria and trade-offs.

```bash
cto ask --mode framework "Comparing PostgreSQL vs MongoDB for our use case"
```

### Advocate Mode
One advisor defends a position while others challenge.

```bash
cto ask --mode advocate "We've decided to migrate to microservices"
```

## Decision Domains

This plugin covers the following decision domains:

- `architecture` - System design and patterns
- `security` - Security and compliance
- `infrastructure` - Cloud, DevOps, deployment
- `data` - Data architecture and storage
- `team` - Team structure and processes
- `vendor` - Build vs buy, vendor selection
- `product` - Product and feature decisions
- `financial` - Budget and ROI analysis

## File Structure

```
plugins/cto-advisory/
├── manifest.yaml              # Main plugin configuration
├── settings.yaml              # Domain-specific defaults
├── personas/
│   ├── facilitator.yaml       # Jordan - Discovery Coach
│   ├── cto.yaml               # Victoria Chen
│   ├── ciso.yaml              # Marcus Webb
│   ├── vp-eng.yaml            # Priya Sharma
│   ├── architect.yaml         # Erik Lindqvist
│   └── specialists/
│       ├── cfo.yaml           # David Park
│       ├── product.yaml       # Sarah Mitchell
│       └── devops.yaml        # Alex Petrov
├── cognitive/
│   ├── discovery.yaml         # Facilitation state machine
│   └── panel.yaml             # Panel mode configuration
└── prompts/
    ├── greeting.md            # Welcome message
    └── synthesis.md           # Synthesis template
```

## Customization

### Modifying Advisors

Edit the persona files in `personas/` to customize advisor backgrounds, priorities, and catch phrases.

### Changing Defaults

Edit `settings.yaml` to change:
- Default interaction mode
- Default advisors for panel
- Discovery mode behavior
- Response formatting

### Adding Custom Frameworks

Create new files in `cognitive/frameworks/` for custom decision frameworks (e.g., `build-vs-buy.yaml`, `tech-debt.yaml`).

## License

MIT
