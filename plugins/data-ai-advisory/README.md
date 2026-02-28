# Data & AI Advisory Board Plugin

AI-powered advisory for data strategy, machine learning, and AI governance.

## Overview

This plugin provides a panel of experienced data and AI leaders who help CDOs, ML engineers, and executives make better decisions about data strategy, ML systems, and AI adoption. It includes:

- **Facilitator**: Robin guides discovery and problem articulation
- **Core Advisors**: CDO, ML Engineering Lead, AI Researcher, Data Platform Architect
- **Specialists**: AI Ethics, Data Privacy, Analytics, Generative AI

## Installation

```bash
cio plugin install data-ai-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🗄️ chief-data-officer | Amara Okafor | CDO, Fortune 100 | Data strategy, governance, data-as-product |
| ⚙️ ml-engineering-lead | Yuri Volkov | Head of ML Eng, ex-FAANG | MLOps, model serving, feature stores |
| 🔬 ai-researcher | Dr. Sofia Chen | AI Research Director | Feasibility, model selection, SOTA |
| 🏗️ data-platform-architect | Henrik Larsson | Principal Architect | Lakehouse, data mesh, streaming |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| ⚖️ ai-ethics | Dr. Kenji Watanabe | AI Ethics Lead | ethics, bias, fairness, eu ai act |
| 🔐 data-privacy | Elena Vasquez | Privacy Architect | privacy, gdpr, pii, anonymization |
| 📊 analytics-lead | Mei-Lin Park | VP Analytics | dashboard, kpi, metrics, bi, visualization |
| ✨ genai-specialist | Omar Hassan | GenAI Specialist | llm, rag, fine-tune, prompt engineering, vector |

## Interaction Modes

### Discovery Mode (Default)
Robin facilitates problem articulation before bringing in the panel.

```bash
cio --domain data-ai-advisory
# Robin will guide you through discovery
```

### Panel Mode
Get perspectives from multiple advisors at once.

```bash
cio ask --domain data-ai-advisory --mode panel "Should we build a feature store or use a managed service?"
```

### Framework Mode
Structured decision framework with criteria and trade-offs.

```bash
cio ask --domain data-ai-advisory --mode framework "Comparing Snowflake vs Databricks for our analytics workload"
```

### Advocate Mode
One advisor defends a position while others challenge.

```bash
cio ask --domain data-ai-advisory --mode advocate "We've decided to fine-tune our own LLM instead of using RAG"
```

## Decision Domains

- `data_strategy` - Data vision, roadmap, and organizational maturity
- `data_governance` - Quality, cataloging, ownership, and compliance
- `ml_engineering` - MLOps, model serving, and production ML systems
- `ai_research` - Feasibility, model selection, and state-of-the-art assessment
- `data_architecture` - Data stack, lakehouse, streaming, and data mesh
- `analytics` - BI strategy, KPI frameworks, and self-service analytics
- `ai_ethics` - Bias, fairness, responsible AI, and regulatory compliance
- `data_privacy` - GDPR, CCPA, PII handling, and privacy-by-design
- `generative_ai` - LLM use cases, RAG, fine-tuning, and prompt engineering
- `data_operations` - Pipelines, orchestration, and data reliability

## File Structure

```
plugins/data-ai-advisory/
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
Create new files in `cognitive/frameworks/` for custom data/AI decision frameworks (e.g., `model-selection.yaml`, `data-stack-evaluation.yaml`).

## License

MIT
