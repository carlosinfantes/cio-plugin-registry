# Marketing & Brand Advisory Board Plugin

AI-powered CMO-level counsel for marketing strategy, demand generation, and brand building.

## Overview

This plugin provides a panel of experienced marketing leaders who help CMOs, marketing teams, and founders make better marketing decisions. It includes:

- **Facilitator**: Noor guides discovery and marketing problem articulation
- **Core Advisors**: CMO, Demand Gen, Brand Strategy, Content/SEO
- **Specialists**: Paid Media, Product Marketing, Community/Events, Marketing Ops

## Installation

```bash
cio plugin install marketing-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🎨 cmo | Claire Dubois | CMO | Marketing strategy, category narrative, brand |
| 🔥 demand-gen | Jason Park | VP Demand Gen | Pipeline, multi-channel, ABM, sales alignment |
| ✨ brand-strategy | Adaeze Obi | VP Brand Strategy | Brand identity, messaging, PR/comms |
| 📝 content-strategy | Will Torres | VP Content & SEO | Content-led growth, organic traffic, thought leadership |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 💸 paid-acquisition | Rebecca Liu | Paid Media Lead | paid, ads, ppc, roas, cpa, retargeting |
| 🎤 product-marketing | Ines Delgado | VP PMM | positioning, launch, gtm, battlecard, sales enablement |
| 🎪 community-events | Tobias Fernandez | Head of Community | community, event, conference, webinar, advocacy |
| ⚙️ marketing-ops | Priya Mehta | VP Marketing Ops | martech, automation, attribution, lead scoring, crm |

## Interaction Modes

### Discovery Mode (Default)
Noor facilitates marketing problem articulation before bringing in the panel.

```bash
cio --domain marketing-advisory
# Noor will guide you through discovery
```

### Panel Mode
Get perspectives from multiple marketing advisors at once.

```bash
cio ask --domain marketing-advisory --mode panel "How should we allocate our $500K Q2 marketing budget?"
```

### Framework Mode
Structured marketing decision framework with channel analysis.

```bash
cio ask --domain marketing-advisory --mode framework "Evaluating content-led growth vs paid acquisition for our developer tool"
```

### Advocate Mode
One advisor defends a marketing position while others challenge.

```bash
cio ask --domain marketing-advisory --mode advocate "We should cut all paid spend and go 100% organic"
```

## Decision Domains

- `marketing_strategy` - Marketing vision, budget, and org structure
- `demand_generation` - Pipeline, campaigns, ABM, lead generation
- `brand_strategy` - Brand identity, voice, messaging, PR
- `content` - Content strategy, editorial, thought leadership
- `paid_media` - Paid channels, ROAS optimization, attribution
- `product_marketing` - Positioning, GTM launches, sales enablement
- `community` - Community building, events, customer advocacy
- `marketing_operations` - Martech, automation, reporting
- `seo` - Search strategy, organic growth, keyword strategy
- `analytics` - Marketing analytics, attribution, performance measurement

## File Structure

```
plugins/marketing-advisory/
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
Create new files in `cognitive/frameworks/` for custom marketing decision frameworks (e.g., `channel-mix-evaluation.yaml`, `brand-positioning.yaml`).

## License

MIT
