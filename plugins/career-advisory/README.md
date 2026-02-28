# Career & Growth Advisory Board Plugin

AI-powered career guidance for professional development, transitions, and negotiations.

## Overview

This plugin provides a panel of experienced career professionals who help individuals navigate job changes, salary negotiations, career pivots, and professional growth. It includes:

- **Facilitator**: Cameron guides discovery with empathy and clarity
- **Core Advisors**: Career Coach, Executive Recruiter, Negotiation Expert, Personal Brand Strategist
- **Specialists**: Career Pivot, Tech Career, Freelance, Leadership Development

## Installation

```bash
cio plugin install career-advisory
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🌟 career-coach | Dr. Maya Robinson | Executive Career Coach (ICF MCC) | Purpose, transitions, org politics |
| 🔍 recruiter | Tyler Brooks | Executive Recruiter | Job search, resume, how hiring works |
| 💰 negotiation-expert | Priya Desai | Compensation Strategist | Salary, equity, total comp negotiation |
| 📣 personal-brand | Jordan Avery | Personal Brand Strategist | LinkedIn, thought leadership, visibility |

### Specialists (Auto-Summoned)

| Advisor | Name | Triggered By |
|---------|------|--------------|
| 🔄 career-pivot | Nkechi Eze | pivot, career change, new field, starting over |
| 💻 tech-career | Raj Patel | engineer, developer, ic, staff, coding interview |
| 🦅 freelance-career | Mia Thornton | freelance, consulting, independent, client |
| 👔 leadership-dev | Marcus Webb | leadership, executive presence, management |

## Decision Domains

career_strategy, job_search, negotiation, personal_brand, career_transitions, tech_career, freelancing, leadership, skill_development, networking

## File Structure

```
plugins/career-advisory/
├── manifest.yaml
├── settings.yaml
├── cognitive/
│   ├── discovery.yaml
│   └── panel.yaml
├── prompts/
│   ├── greeting.md
│   └── synthesis.md
└── README.md
```

## License

MIT
