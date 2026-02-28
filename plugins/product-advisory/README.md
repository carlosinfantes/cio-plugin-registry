# Product & Growth Advisory Board Plugin

AI-powered CPO-level counsel for product strategy, growth, and user experience.

## Overview

This plugin provides a panel of experienced product leaders who help CPOs, PMs, and growth leaders make better product decisions. It includes:

- **Facilitator**: Jules guides discovery and product problem articulation
- **Core Advisors**: CPO, Growth Lead, UX Research, Product Analytics
- **Specialists**: Pricing, Platform/API, Competitive Intel, Mobile

## Installation

```bash
cio plugin install product-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🎯 cpo | Sarah Mitchell | CPO | Product vision, roadmap, prioritization |
| 📈 growth-lead | Marcus Johnson | VP Growth | PLG, funnels, activation, retention |
| 🔬 ux-research | Dr. Lin Zhou | VP UX Research | User research, usability, design psychology |
| 📊 product-analytics | Raj Krishnan | Head of Analytics | Metrics, experimentation, causal inference |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 💰 pricing-strategy | Erica Fontaine | Pricing Strategist | pricing, freemium, tier, monetization |
| 🔌 platform-product | Diego Alvarez | Platform PM | platform, api, sdk, marketplace, ecosystem |
| 🗺️ competitive-intel | Natasha Petrova | Competitive Intel | competitor, positioning, differentiation |
| 📱 mobile-product | Kenji Tanaka | Mobile Product Lead | mobile, ios, android, cross-platform |

## Interaction Modes

### Discovery Mode (Default)
Jules facilitates product problem articulation before bringing in the panel.

```bash
cio --domain product-advisory
# Jules will guide you through discovery
```

### Panel Mode
Get perspectives from multiple product advisors at once.

```bash
cio ask --domain product-advisory --mode panel "Should we go PLG or sales-led for our new enterprise product?"
```

### Framework Mode
Structured product decision framework with impact-effort analysis.

```bash
cio ask --domain product-advisory --mode framework "Prioritizing Q2 roadmap: AI features vs platform APIs vs mobile app"
```

### Advocate Mode
One advisor defends a product position while others challenge.

```bash
cio ask --domain product-advisory --mode advocate "We should sunset the free tier to improve unit economics"
```

## Decision Domains

- `product_strategy` - Product vision, roadmap, prioritization
- `growth` - Growth engines, activation, retention, funnels
- `user_research` - User research, usability, design strategy
- `product_analytics` - Metrics, experimentation, data culture
- `pricing` - Pricing models, packaging, monetization
- `platform` - API strategy, developer experience, ecosystem
- `competitive_strategy` - Competitive landscape, positioning, category
- `mobile` - Mobile product strategy, cross-platform
- `experimentation` - A/B testing, experiment design, statistical rigor
- `roadmap` - Roadmap planning, prioritization frameworks

## File Structure

```
plugins/product-advisory/
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
Create new files in `cognitive/frameworks/` for custom product decision frameworks (e.g., `feature-prioritization.yaml`, `pricing-model-evaluation.yaml`).

## License

MIT
