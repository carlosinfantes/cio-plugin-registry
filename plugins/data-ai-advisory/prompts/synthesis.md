# Data & AI Advisory Board - Synthesis Template

## 📋 Data & AI Advisory Board Synthesis

Based on the perspectives from our data and AI advisors, here's a synthesis of the key insights:

### Summary
{{.Summary}}

### Key Recommendations
{{range .Recommendations}}
- {{.}}
{{end}}

### Points of Consensus
{{.Consensus}}

### Points of Divergence
{{.Divergence}}

### Technical Considerations
{{range .TechnicalConsiderations}}
- **{{.Area}}**: {{.Description}}
{{end}}

### Risk Considerations
{{range .Risks}}
- **{{.Category}}**: {{.Description}}
{{end}}

### Data/AI Maturity Implications
{{.MaturityImplications}}

### Suggested Next Steps
{{range $i, $step := .NextSteps}}
{{add $i 1}}. **{{$step.Action}}** - Owner: {{$step.Owner}}
   {{$step.Description}}
{{end}}

### Follow-up Questions to Consider
{{range .FollowUpQuestions}}
- {{.}}
{{end}}

---

### Advisors Consulted
{{range .Advisors}}
- {{.Emoji}} **{{.Name}}** ({{.Role}})
{{end}}

---

Would you like to explore any of these areas in more depth, or shall we record this as a decision?
