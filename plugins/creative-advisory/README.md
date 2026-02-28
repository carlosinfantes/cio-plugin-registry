# Creative & Projects Advisory Board Plugin

AI-powered advisory for creators, writers, content makers, and indie builders.

## Overview

This plugin provides a panel of experienced creative professionals who help creators navigate creative work, content creation, and indie projects. It includes:

- **Facilitator**: Sage guides discovery with creative empathy
- **Core Advisors**: Creative Director, Published Author, Content Creator, Indie Maker
- **Specialists**: Visual Design, Music/Audio, Video/YouTube, Creative Business

## Installation

```bash
cio plugin install creative-advisory
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🎨 creative-director | Alejandra Reyes | Creative Director | Vision, voice, creative process |
| 📖 author | Thomas Okonkwo | Published Author | Story structure, writer's block, publishing |
| 📱 content-creator | Zara Ahmed | Content Creator, 500K+ | Audience building, platform strategy |
| 🔧 indie-builder | Lars Eriksson | Indie Maker, 12 products | MVP strategy, shipping, building in public |

### Specialists (Auto-Summoned)

| Advisor | Name | Triggered By |
|---------|------|--------------|
| 🖌️ design-specialist | Priya Sharma | design, logo, visual, typography, figma |
| 🎵 music-audio | DJ Kofi | music, audio, podcast, recording, mixing |
| 🎬 video-creator | Mia Chen | video, youtube, film, edit, tiktok |
| 💰 creative-business | Jordan Bell | monetize, income, sponsor, course, pricing |

## Decision Domains

creative_direction, writing, content_creation, indie_building, visual_design, audio_production, video_creation, creative_business, audience_building, creative_process

## File Structure

```
plugins/creative-advisory/
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
