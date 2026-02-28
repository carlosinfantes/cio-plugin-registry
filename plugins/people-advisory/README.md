# People & Culture Advisory Board Plugin

AI-powered CHRO-level counsel for people strategy, organizational design, and talent management.

## Overview

This plugin provides a panel of experienced HR and people leaders who help CHROs, executives, and managers make better people decisions. It includes:

- **Facilitator**: Maya guides discovery and problem articulation
- **Core Advisors**: CHRO, Org Designer, Talent Lead, Total Rewards
- **Specialists**: DEI, Learning & Development, Employee Relations, Remote/Hybrid

## Installation

```bash
cio plugin install people-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 👑 chro | Patricia Okonkwo | CHRO | People strategy, culture, change management |
| 🏛️ org-designer | Henrik Svensson | VP Org Design | Team topologies, operating models, reorgs |
| 🎯 talent-lead | Jasmine Kwon | SVP Talent | Recruiting, employer brand, hiring pipelines |
| 💎 total-rewards | David Nakamura | VP Total Rewards | Comp benchmarking, equity design, analytics |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 🌍 dei-lead | Amara Jackson | VP DEI | diversity, equity, inclusion, belonging, bias |
| 📚 learning-dev | Thomas Fischer | VP L&D | training, career, promotion, mentorship, succession |
| ⚖️ employee-relations | Monica Reyes | VP ER | termination, pip, investigation, layoff, severance |
| 🌐 remote-work | Alex Chen | Head of Remote | remote, hybrid, rto, distributed, async |

## Interaction Modes

### Discovery Mode (Default)
Maya facilitates people problem articulation before bringing in the panel.

```bash
cio --domain people-advisory
# Maya will guide you through discovery
```

### Panel Mode
Get perspectives from multiple people advisors at once.

```bash
cio ask --domain people-advisory --mode panel "How should we restructure engineering after the acquisition?"
```

### Framework Mode
Structured people decision framework with stakeholder analysis.

```bash
cio ask --domain people-advisory --mode framework "Evaluating remote-first vs hybrid vs return-to-office"
```

### Advocate Mode
One advisor defends a position while others challenge.

```bash
cio ask --domain people-advisory --mode advocate "We should implement a mandatory return-to-office policy"
```

## Decision Domains

- `people_strategy` - Workforce planning, people vision
- `organizational_design` - Org structure, team topologies, reorgs
- `talent_acquisition` - Hiring strategy, employer brand, pipelines
- `total_rewards` - Compensation, equity, benefits
- `dei` - Diversity, equity, inclusion programs
- `learning_development` - Training, career frameworks, succession
- `employee_relations` - Performance management, investigations, separations
- `performance_management` - Reviews, calibration, feedback systems
- `remote_hybrid` - Work model strategy, distributed team effectiveness
- `culture` - Culture building, engagement, values

## File Structure

```
plugins/people-advisory/
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
Create new files in `cognitive/frameworks/` for custom people decision frameworks (e.g., `org-design-assessment.yaml`, `compensation-review.yaml`).

## License

MIT
