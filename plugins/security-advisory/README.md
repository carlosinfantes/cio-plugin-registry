# Security Advisory Board Plugin

AI-powered CISO-level counsel for cybersecurity strategy and operations.

## Overview

This plugin provides a panel of experienced security leaders who help CISOs, security teams, and engineering leaders make better cybersecurity decisions. It includes:

- **Facilitator**: Sam guides discovery and security problem articulation
- **Core Advisors**: CISO, AppSec Lead, Security Architect, Incident Commander
- **Specialists**: Compliance/GRC, Cloud Security, Threat Intel, Privacy Engineering

## Installation

```bash
cio plugin install security-advisory
```

To verify it's installed:

```bash
cio plugin list
```

## Advisors

### Core Advisors

| Advisor | Name | Role | Focus |
|---------|------|------|-------|
| 🛡️ ciso | Marcus Webb | CISO, Fortune 500 | Risk quantification, security strategy, board comms |
| 🔐 appsec-lead | Riya Patel | Head of AppSec | OWASP, threat modeling, secure SDLC |
| 🏰 security-architect | Dmitri Volkov | Principal Security Architect | Zero trust, IAM, cloud security posture |
| 🚨 incident-commander | Nora Eriksen | Head of SecOps & IR | Detection engineering, SOC ops, tabletops |

### Specialists (Auto-Summoned)

| Advisor | Name | Role | Triggered By |
|---------|------|------|--------------|
| 📋 compliance-architect | Catherine Nguyen | GRC Lead | soc2, iso 27001, fedramp, hipaa, nist |
| ☁️ cloud-security | Jamal Washington | Cloud Security | aws, gcp, azure, terraform, kubernetes |
| 🎯 threat-intel | Elisa Moreno | Threat Intel & Red Team | threat, apt, red team, mitre, ransomware |
| 🔒 privacy-security | Henrik Lindberg | Privacy Engineering | privacy, gdpr, pii, encryption, dlp |

## Interaction Modes

### Discovery Mode (Default)
Sam facilitates security problem articulation before bringing in the panel.

```bash
cio --domain security-advisory
# Sam will guide you through discovery
```

### Panel Mode
Get perspectives from multiple security advisors at once.

```bash
cio ask --domain security-advisory --mode panel "How should we approach zero trust for our hybrid environment?"
```

### Framework Mode
Structured security assessment framework with risk ratings.

```bash
cio ask --domain security-advisory --mode framework "Evaluating SIEM vendors: Splunk vs Sentinel vs Elastic"
```

### Advocate Mode
Red team vs blue team adversarial discussion.

```bash
cio ask --domain security-advisory --mode advocate "Our current authentication system is secure enough"
```

## Decision Domains

- `security_strategy` - Security program, roadmap, and maturity
- `application_security` - AppSec, SDLC, vulnerability management
- `security_architecture` - Zero trust, IAM, network controls
- `incident_response` - IR planning, SOC ops, detection engineering
- `compliance_grc` - SOC2, ISO 27001, FedRAMP, HIPAA, PCI
- `cloud_security` - Cloud posture, container security, DevSecOps
- `threat_management` - Threat intel, red/purple team, adversary emulation
- `identity_access` - IAM, SSO, MFA, RBAC, privileged access
- `data_protection` - Encryption, DLP, privacy engineering
- `security_operations` - SOC tooling, SIEM, SOAR, alert management

## File Structure

```
plugins/security-advisory/
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
Create new files in `cognitive/frameworks/` for custom security decision frameworks (e.g., `risk-assessment.yaml`, `vendor-security-evaluation.yaml`).

## License

MIT
