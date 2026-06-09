# Copilot Workshop — Sample Files (Persona Edition)

Sample files for the 1-hour session **"GitHub Copilot for non-coders, by role"** —
UI/UX Designers, Data Engineers, and Product Owners describing what they want in
plain English and getting real artefacts back (no coding background required).

Open this whole folder in VS Code (**File ▸ Open Folder**) so Copilot can see the files.

```
.
└─ personas/
   ├─ ui-ux/                 ← Design in plain English → spec, tokens, prototype
   │   ├─ design-brief.md
   │   ├─ design-tokens.json
   │   ├─ prototype-starter.html
   │   └─ README.md
   ├─ data-engineer/         ← Build an ETL pipeline, then query the result
   │   ├─ sales_january.csv     (messy on purpose: $ signs, mixed case, commas)
   │   ├─ sales_february.csv    (different column names & date format)
   │   ├─ product_prices.csv    (price lookup table)
   │   └─ PIPELINE.md
   └─ product-owner/         ← Research → great user stories + Definition of Done
       ├─ feature-request.md
       ├─ user-story-template.md
       └─ README.md
```

## The three tracks

- **UI/UX — Design in plain English:** turn `ui-ux/design-brief.md` into a component
  spec, extend `design-tokens.json`, and have Copilot build a working HTML/CSS
  prototype in `prototype-starter.html`. Same muscle you use to drive Figma's AI.
- **Data Engineer — ETL, then query:** clean and merge the messy `data-engineer/`
  exports into one table, join the price list, and immediately run SQL on the result.
- **Product Owner — research & stories:** turn the messy `product-owner/feature-request.md`
  into INVEST user stories with a solid, testable Definition of Done.

Each folder's README has a short, in-room demo flow and prompt starters.

## About the data

All names, emails, and numbers are **fictitious**. People (Megan Bowen, Adele Vance,
Alex Wilber, Diego Siciliani) and the company **Contoso** are Microsoft's standard
sample identities. There is **no real personal data** in this repository.

## Tips

- No setup or installs are required to *read* these files.
- If a track asks you to *run* something, a coach will help — or Copilot will give you the one command to use.
- Always work on a **copy** of real data, never the original.

## License

[MIT](LICENSE) — free to use, copy, and adapt for your own workshops.
