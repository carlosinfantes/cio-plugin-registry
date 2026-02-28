# Financial Advisory Board Plugin

AI-powered CFO-level counsel for financial strategy and business operations.

## Overview

This plugin provides a panel of experienced finance professionals who help CFOs, controllers, and business leaders make better financial decisions. It includes:

- **Facilitator**: Dana guides discovery and financial problem articulation
- **Core Advisors**: CFO, Controller, FP&A, Treasury
- **Specialists**: Tax Strategy, Investor Relations, M&A, Procurement

## Installation

```bash
cio plugin install financial-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 💼 cfo | Richard Ames | CFO, Public Company & PE | Strategy, capital allocation, investor comms |
| 📒 controller | Nadia Kowalski | VP Controller, Big Four | GAAP/IFRS, internal controls, audit readiness |
| 📈 fp-and-a | James Okafor | SVP FP&A | Forecasting, scenario modeling, KPIs |
| 🏦 treasury | Isabelle Moreau | Head of Treasury | Liquidity, debt structuring, FX hedging |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 🧾 tax-strategy | Victor Pham | Head of Tax | tax, irs, transfer pricing, r&d credit |
| 🎤 investor-relations | Amanda Sterling | VP IR | investor, earnings, valuation, ipo |
| 🤝 ma-strategy | Carlos Mendez | M&A | acquisition, merger, due diligence, deal |
| 📦 procurement | Lisa Nakamura | CPO | vendor, procurement, supplier, spend |

## Interaction Modes

### Discovery Mode (Default)
Dana facilitates financial problem articulation before bringing in the panel.

```bash
cio --domain financial-advisory
# Dana will guide you through discovery
```

### Panel Mode
Get perspectives from multiple financial advisors at once.

```bash
cio ask --domain financial-advisory --mode panel "Should we raise debt or equity for this expansion?"
```

### Framework Mode
Structured financial decision framework with criteria and trade-offs.

```bash
cio ask --domain financial-advisory --mode framework "Comparing lease vs buy for our new office space"
```

### Advocate Mode
One advisor defends a financial position while others challenge.

```bash
cio ask --domain financial-advisory --mode advocate "We've decided to pursue an IPO in 18 months"
```

## Decision Domains

- `capital_allocation` - Investment and resource allocation
- `financial_planning` - Budgets, forecasts, scenarios
- `treasury` - Cash management and financing
- `tax_strategy` - Tax planning and optimization
- `investor_relations` - Investor communication and positioning
- `mergers_acquisitions` - M&A evaluation and execution
- `procurement` - Vendor and spend management
- `accounting` - Financial reporting and controls
- `compliance` - Financial regulatory compliance
- `pricing` - Pricing strategy and analysis

## File Structure

```
plugins/financial-advisory/
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
Create new files in `cognitive/frameworks/` for custom financial decision frameworks (e.g., `capital-allocation.yaml`, `pricing-strategy.yaml`).

## License

MIT
