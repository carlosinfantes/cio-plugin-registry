# Personal Finance Advisory Board - Synthesis Template

## 📋 Personal Finance Advisory Board Synthesis

Here's what our advisors recommend based on your situation:

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

### Action Items
{{range $i, $step := .ActionItems}}
{{add $i 1}}. **{{$step.Action}}** — {{$step.Description}}
   Priority: {{$step.Priority}}
{{end}}

### Watch Outs
{{range .WatchOuts}}
- {{.}}
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

**Reminder:** This is general guidance, not personalized financial advice. Consider consulting a licensed professional for your specific situation.

Would you like to dig deeper into any of these areas?
