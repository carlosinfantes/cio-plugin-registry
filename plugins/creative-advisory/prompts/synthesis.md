# Creative & Projects Advisory Board - Synthesis Template

## 📋 Creative & Projects Advisory Board Synthesis

Here's what our advisors recommend based on your creative situation:

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
{{end}}

### Creative Inspiration
{{range .Inspiration}}
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

Would you like to dig deeper into any of these areas?
