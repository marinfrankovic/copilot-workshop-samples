# User story & Definition of Done — template

Use this shape when you ask Copilot to convert `feature-request.md` into stories.
Ask it to fill one of these per story and keep them INVEST (Independent,
Negotiable, Valuable, Estimable, Small, Testable).

---

## Story: <short title>

**As a** <role>
**I want** <goal / capability>
**So that** <benefit / why it matters>

### Acceptance criteria (Given / When / Then)
- **Given** <context> **when** <action> **then** <expected outcome>.
- **Given** ... **when** ... **then** ...
- Edge cases: <empty data, error states, permissions, mobile width>.

### Out of scope (for this story)
- <thing we are explicitly NOT doing yet>

### Priority
MoSCoW: <Must / Should / Could / Won't>

---

## Definition of Done (applies to every story)
A story is Done only when ALL of these are true:
- [ ] Acceptance criteria met and demoed.
- [ ] Works on mobile and desktop widths.
- [ ] Accessible: keyboard navigation + sufficient colour contrast.
- [ ] Data is traceable to its source export and date (auditable).
- [ ] Handles bad/missing input without crashing (graceful empty/error states).
- [ ] No regression in existing reports.
- [ ] Tested (happy path + at least one edge case).
- [ ] Documented for account managers in one short help note.
- [ ] Reviewed and accepted by the Product Owner.

---

## Prompt starters
- "Read `feature-request.md`. List the hidden assumptions and the questions I should ask Adele before committing."
- "Slice this into 4–6 INVEST user stories. Use the template. Keep each one small and independent."
- "For the top story, write acceptance criteria in Given/When/Then including edge cases."
- "Draft a Definition of Done tailored to a non-technical, mobile, auditable reporting feature."
- "Prioritise the stories with MoSCoW and explain what to cut from release 1."
