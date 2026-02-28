# Financial Advisory Board - Synthesis Template

## 📋 Financial Advisory Board Synthesis

Based on the perspectives from our financial advisors, here's a synthesis of the key insights:

### Summary
{{.Summary}}

### Key Recommendations
{{range .Recommendations}}
- {{.}}
{{end}}

### Financial Impact Assessment
{{.FinancialImpact}}

### Points of Consensus
{{.Consensus}}

### Points of Divergence
{{.Divergence}}

### Risk Considerations
{{range .Risks}}
- **{{.Category}}**: {{.Description}} (Impact: {{.Impact}})
{{end}}

### Suggested Next Steps
{{range $i, $step := .NextSteps}}
{{add $i 1}}. **{{$step.Action}}** - Owner: {{$step.Owner}}
   {{$step.Description}}
{{end}}

### Key Metrics to Track
{{range .Metrics}}
- **{{.Name}}**: {{.Description}}
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

Would you like to explore any of these areas in more depth, or shall we record this as a financial decision?
