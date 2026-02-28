# Product & Growth Advisory Board - Synthesis Template

## 📋 Product & Growth Advisory Board Synthesis

Based on the perspectives from our product advisors, here's a synthesis of the key insights:

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

### User Impact Assessment
{{.UserImpact}}

### Risk Considerations
{{range .Risks}}
- **{{.Category}}**: {{.Description}}
{{end}}

### Experiments to Run
{{range .Experiments}}
- **{{.Name}}**: {{.Description}} (Metric: {{.Metric}})
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

Would you like to explore any of these areas in more depth, or shall we record this as a product decision?
