# Raw feature request — as it actually arrived

This is the messy, real-world input a Product Owner gets. The job: use Copilot
to research the ambiguity, then turn this into well-formed user stories with a
solid Definition of Done. Do NOT just accept it as written.

---

**From:** Adele Vance (Head of Customer Success), Contoso
**Channel:** Teams message, forwarded by a stakeholder

> Hey — customers keep asking us "where's my data / why is it different from last
> month". We need some kind of self-serve thing so account managers can pull
> their own monthly numbers without emailing us. Megan said exports are a mess
> (dollar signs, different columns). Also some people want it in the app, some
> want a download, finance wants it "auditable". Oh and it has to work on mobile.
> Can we get this in before the next QBR? Not sure what's realistic.

---

## Known facts / constraints (from other notes)
- Source data is the monthly sales exports (see the data-engineer track CSVs) — inconsistent formats.
- "Auditable" = finance wants to know which export and date a number came from.
- Account managers are non-technical and time-poor.
- Mobile use is common (they check between meetings).
- No fixed deadline beyond a vague "before the QBR".

## What I want from Copilot (the loop)
1. **Research / clarify:** list the open questions and assumptions hidden in this request.
2. **Slice:** break it into small, independent user stories (INVEST).
3. **Write:** each story in role–goal–benefit form with acceptance criteria.
4. **Definition of Done:** produce a solid, testable DoD (use the template).
5. **Refine:** prioritise (MoSCoW) and flag what is NOT in scope for the first release.
