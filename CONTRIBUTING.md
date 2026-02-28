# Contributing a Plugin

CIO plugins are domain-specific advisory boards. Anyone can contribute one via PR.

## Quick Start

```bash
# 1. Install CIO and scaffold a plugin
cio plugin create my-domain

# 2. Fork this repo and copy your plugin in
cp -r ~/.cio/plugins/custom/my-domain plugins/my-domain

# 3. Validate
./scripts/validate-plugin.sh plugins/my-domain

# 4. Open a PR
```

## Plugin Structure

```
plugins/my-domain/
├── manifest.yaml          # Required — plugin definition
├── settings.yaml          # Optional — default settings
├── personas/              # Optional — detailed persona files
│   ├── facilitator.yaml
│   ├── advisor-one.yaml
│   └── specialists/
│       └── specialist-one.yaml
├── cognitive/             # Optional — cognitive process definitions
│   └── discovery.yaml
└── prompts/               # Optional — prompt templates
    ├── greeting.md
    └── synthesis.md
```

## manifest.yaml Reference

Every plugin must have a `manifest.yaml` in its root. The `domain` field must match the directory name.

```yaml
domain: my-domain                              # Must match directory name
version: "1.0.0"                               # Semver
display_name: "My Domain Advisory Board"
description: "One-line description of what this board advises on."
author: "Your Name"
license: "MIT"
homepage: "https://github.com/you/repo"

# The facilitator greets users and helps frame their question
facilitator:
  id: "facilitator"
  name: "Jordan"
  role: "Discovery Coach"
  emoji: "💭"
  color: "141"
  thinking_style: "Help me understand the full picture"
  greeting_prompt: |
    Hi! I'm here to help you frame your question
    before we bring in the experts.

# Core advisors (always present in panel discussions)
core_advisors:
  - id: "advisor-1"
    name: "Expert One"
    role: "Strategy Advisor"
    emoji: "🎯"
    color: "39"
    thinking_style: "Strategic, long-term perspective"
    background: "Brief professional background..."
    priorities:
      - "Priority one"
      - "Priority two"
    catch_phrases:
      - "A signature question or statement"

  - id: "advisor-2"
    name: "Expert Two"
    role: "Operations Advisor"
    emoji: "⚡"
    color: "208"
    thinking_style: "Practical, execution-focused"
    background: "Brief professional background..."
    priorities:
      - "Feasibility"
      - "Best practices"
    catch_phrases:
      - "Can we actually ship this?"

# Specialists (auto-summoned when keywords appear in the question)
specialists:
  - id: "finance-specialist"
    name: "Finance Expert"
    role: "Financial Advisor"
    emoji: "💰"
    color: "226"
    thinking_style: "What's the ROI?"
    keywords:
      - budget
      - cost
      - pricing
      - roi
    priorities:
      - "Cost analysis"
      - "Budget planning"

# Categories for organizing decisions
decision_domains:
  - strategy
  - operations
  - technology
```

### Required Fields

| Field | Description |
|-------|-------------|
| `domain` | Unique identifier, must match directory name |
| `version` | Semver version string |
| `display_name` | Human-readable name |
| `facilitator.name` | Facilitator character name |
| `core_advisors[].id` | Unique ID per advisor |
| `core_advisors[].name` | Advisor character name |
| `core_advisors[].role` | One-line role description |

### Colors

Colors are ANSI 256 color codes. Common choices:
- `39` blue, `46` green, `196` red, `226` yellow, `208` orange
- `201` pink, `141` purple, `51` cyan, `245` gray

## Validation

Before submitting, run the validator:

```bash
./scripts/validate-plugin.sh plugins/my-domain
```

It checks:
- `manifest.yaml` exists and parses
- Required fields are present
- Domain matches directory name
- Version is valid semver
- At least one core advisor with id/name/role

## PR Checklist

- [ ] Directory name matches `domain` field in manifest
- [ ] `./scripts/validate-plugin.sh plugins/my-domain` passes
- [ ] Advisors have distinct, well-defined roles (not generic)
- [ ] `thinking_style` and `catch_phrases` reflect each advisor's personality
- [ ] Specialists have relevant `keywords` for auto-summoning
- [ ] Description is clear and concise
- [ ] No offensive or inappropriate content

## How It Works

When a PR is merged:
1. CI validates all manifests
2. CI packages each plugin as `<domain>-<version>.tar.gz`
3. CI rebuilds `index.json` with all plugin metadata
4. Users can then `cio plugin install my-domain`

## Tips for Great Plugins

- **Give advisors distinct personalities.** Each advisor should have a unique perspective and thinking style. Avoid generic "expert" personas.
- **Use realistic backgrounds.** Advisors feel more authentic with specific experience (e.g., "15 years in healthcare IT" vs "experienced professional").
- **Keywords matter.** Specialist keywords determine when they auto-join a discussion. Be specific but comprehensive.
- **Test locally first.** Use `cio plugin use my-domain` and run a few conversations to see how the advisors interact.
- **Localization is welcome.** Plugins in any language are encouraged (see `peluqueria` for a Spanish example).
