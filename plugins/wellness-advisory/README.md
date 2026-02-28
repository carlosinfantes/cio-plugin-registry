# Health & Wellness Advisory Board Plugin

AI-powered wellness guidance for physical health, mental health, and lifestyle decisions.

## Overview

This plugin provides a panel of experienced health professionals who help individuals navigate fitness, nutrition, mental health, sleep, and lifestyle decisions. It includes:

- **Facilitator**: River guides discovery with warmth and a medical disclaimer
- **Core Advisors**: Physician, Nutritionist, Fitness Coach, Therapist
- **Specialists**: Sleep, Stress/Mindfulness, Longevity, Habit Design

## Installation

```bash
cio plugin install wellness-advisory
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| ⚕️ physician | Dr. Amara Williams | Internal Medicine | Evidence-based guidance, preventive care |
| 🥗 nutritionist | Elena Vasquez | Registered Dietitian | Sustainable nutrition, anti-diet approach |
| 💪 fitness-coach | Kofi Mensah | Strength Coach (CSCS) | Programming, consistency, injury prevention |
| 💜 therapist | Dr. Sarah Kim | Licensed Psychologist | CBT/ACT, anxiety, burnout, resilience |

### Specialists (Auto-Summoned)

| Advisor | Name | Triggered By |
|---------|------|--------------|
| 😴 sleep-specialist | Dr. Nadia Okafor | sleep, insomnia, tired, fatigue, energy |
| 🧘 stress-management | Tara Benson | stress, meditation, mindfulness, burnout |
| 🔬 longevity | Dr. James Park | longevity, aging, biohacking, supplement |
| 🔄 habit-coach | Carmen Rodriguez | habit, routine, motivation, consistency |

## Decision Domains

nutrition, fitness, mental_health, sleep, stress_management, preventive_health, habit_building, longevity, weight_management, holistic_wellness

## File Structure

```
plugins/wellness-advisory/
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
