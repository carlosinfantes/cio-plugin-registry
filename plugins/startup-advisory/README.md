# Startup Advisory Board Plugin

AI-powered advisory board for founders and early-stage companies.

## Overview

This plugin provides a panel of experienced startup advisors who help founders navigate the toughest decisions in the startup journey. It includes:

- **Facilitator**: Kai guides discovery and problem articulation
- **Core Advisors**: Serial Founder, VC Partner, Growth Operator, Startup CTO
- **Specialists**: Fundraising, Product-Market Fit, Hiring, Startup Legal

## Installation

```bash
cio plugin install startup-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🔥 serial-founder | Tomas Eriksson | 3x Founder, 2 Exits | Pattern recognition, founder psychology, pivots |
| 💎 vc-partner | Priya Kapoor | General Partner, Tier 1 VC | Market sizing, fundraising, board management |
| 📈 growth-operator | Marcus Johnson | VP Growth | GTM strategy, growth engines, CAC/LTV |
| ⚡ startup-cto | Aisha Osei | Technical Co-Founder, YC | MVP architecture, pragmatic tech choices |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 💰 fundraising | Daniel Cho | Fundraising Advisor | raise, round, term sheet, cap table, safe |
| 🎯 product-market-fit | Lena Petrova | PMF Specialist | pmf, validation, churn, pivot, experiment |
| 👥 hiring | Nkechi Adeyemi | Talent & Culture | hire, recruit, team, equity, co-founder |
| ⚖️ legal-startup | Rachel Gutierrez | Startup Legal | incorporate, patent, ip, 83b, delaware |

## Interaction Modes

### Discovery Mode (Default)
Kai facilitates problem articulation before bringing in the panel.

```bash
cio --domain startup-advisory
# Kai will guide you through discovery
```

### Panel Mode
Get perspectives from multiple advisors at once.

```bash
cio ask --domain startup-advisory --mode panel "Should we pivot our product or double down?"
```

### Framework Mode
Structured decision framework with criteria and trade-offs.

```bash
cio ask --domain startup-advisory --mode framework "Comparing PLG vs sales-led for our B2B SaaS"
```

### Advocate Mode
One advisor defends a position while others challenge.

```bash
cio ask --domain startup-advisory --mode advocate "We've decided to raise a Series A at $30M pre"
```

## Decision Domains

- `fundraising` - Fundraising timing, strategy, and execution
- `product_market_fit` - PMF discovery and validation
- `go_to_market` - GTM strategy and channel selection
- `hiring` - Early-stage talent and team building
- `technical_architecture` - MVP and scaling tech decisions
- `pricing` - Pricing models and packaging
- `pivoting` - Pivot vs persist decisions
- `co_founder` - Co-founder dynamics and alignment
- `legal_formation` - Entity structure and IP protection
- `growth_strategy` - Growth engines and scaling

## File Structure

```
plugins/startup-advisory/
├── manifest.yaml              # Main plugin configuration
├── settings.yaml              # Domain-specific defaults
├── cognitive/
│   ├── discovery.yaml         # Facilitation state machine
│   └── panel.yaml             # Panel mode configuration
├── prompts/
│   ├── greeting.md            # Welcome message
│   └── synthesis.md           # Synthesis template
└── README.md                  # This file
```

## Customization

### Modifying Advisors
Edit `manifest.yaml` to customize advisor backgrounds, priorities, and catch phrases.

### Changing Defaults
Edit `settings.yaml` to change default interaction mode, default advisors, discovery behavior, and response formatting.

### Adding Custom Frameworks
Create new files in `cognitive/frameworks/` for custom startup decision frameworks (e.g., `pivot-or-persist.yaml`, `fundraise-timing.yaml`).

## License

MIT
