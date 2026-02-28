# Security Advisory Board - Synthesis Template

## 📋 Security Advisory Board Synthesis

Based on the perspectives from our security advisors, here's a synthesis of the key insights:

### Summary
{{.Summary}}

### Key Recommendations
{{range .Recommendations}}
- {{.}}
{{end}}

### Risk Assessment
{{range .Risks}}
- **{{.Category}}** ({{.Severity}}): {{.Description}}
  - Likelihood: {{.Likelihood}} | Impact: {{.Impact}}
{{end}}

### Points of Consensus
{{.Consensus}}

### Points of Divergence
{{.Divergence}}

### Quick Wins
{{range .QuickWins}}
- {{.}}
{{end}}

### Suggested Next Steps
{{range $i, $step := .NextSteps}}
{{add $i 1}}. **{{$step.Action}}** - Owner: {{$step.Owner}} | Priority: {{$step.Priority}}
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

Would you like to explore any of these areas in more depth, or shall we record this as a security decision?
