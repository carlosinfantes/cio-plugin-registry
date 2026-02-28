# Health & Wellness Advisory Board - Synthesis Template

## 📋 Health & Wellness Advisory Board Synthesis

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
   Sustainability: {{$step.Sustainability}}
{{end}}

### Important Cautions
{{range .Cautions}}
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

**Reminder:** This is general wellness guidance. Please consult your healthcare provider for medical decisions specific to your situation.

Would you like to dig deeper into any of these areas?
