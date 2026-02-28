# Startup Advisory Board - Synthesis Template

## 📋 Startup Advisory Board Synthesis

Based on the perspectives from our advisors, here's a synthesis of the key insights:

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

### Risk Considerations
{{range .Risks}}
- **{{.Category}}**: {{.Description}}
{{end}}

### Key Milestones
{{range $i, $milestone := .Milestones}}
{{add $i 1}}. **{{$milestone.Name}}** — {{$milestone.Description}}
   Target: {{$milestone.Target}}
{{end}}

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

Would you like to dig deeper into any of these areas, or shall we record this as a decision?
