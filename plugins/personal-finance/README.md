# Personal Finance Advisory Board Plugin

AI-powered personal finance guidance for life's biggest money decisions.

## Overview

This plugin provides a panel of experienced financial professionals who help individuals navigate investing, budgeting, debt, retirement, and major financial life decisions. It includes:

- **Facilitator**: Pat guides discovery with a warm, no-judgment approach
- **Core Advisors**: Financial Planner, Investment Advisor, Tax Strategist, Behavioral Coach
- **Specialists**: Debt Strategy, Retirement Planning, Real Estate, Freelance Finance

## Installation

```bash
cio plugin install personal-finance
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 📋 financial-planner | Grace Kimura | CFP, 20+ Years | Holistic planning, goals, insurance |
| 📈 investment-advisor | Marcus Obi | CFA Charterholder | Asset allocation, index investing, behavioral traps |
| 🧾 tax-strategist | Linda Chow | CPA | Tax-efficient investing, retirement accounts |
| 🧠 behavioral-coach | Dr. James Adler | Behavioral Finance | Money psychology, anxiety, couples dynamics |

### Specialists (Auto-Summoned)

| Advisor | Name | Triggered By |
|---------|------|--------------|
| 🔓 debt-specialist | Alicia Moreno | debt, credit card, loan, refinance |
| 🏖️ retirement-specialist | Robert Tanaka | retirement, 401k, ira, social security, fire |
| 🏠 real-estate | Nina Castellano | house, buy, rent, mortgage, property |
| 💻 freelance-finance | Diego Santos | freelance, 1099, side hustle, quarterly tax |

## Decision Domains

financial_planning, investing, tax_strategy, debt_management, retirement_planning, real_estate, insurance, budgeting, self_employment, money_psychology

## File Structure

```
plugins/personal-finance/
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
