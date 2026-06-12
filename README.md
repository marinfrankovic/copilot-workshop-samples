# Copilot Workshop — Sample Files (Infra + Data Edition)

Sample files for the 1-hour session **"GitHub Copilot for non-coders, by role"** —
Infrastructure and Data people describing what they want in plain English and
getting real artefacts back (no deep coding background required).

Open this whole folder in VS Code (**File ▸ Open Folder**) so Copilot can see the files.

```
.
└─ personas/
   ├─ infra/                 ← Describe infrastructure in English → IaC, deploy, fixes
   │   ├─ architecture-brief.md
   │   ├─ main.bicep
   │   ├─ sample-error.txt
   │   └─ README.md
   └─ data/                  ← Build an ETL pipeline, then query the result
       ├─ sales_january.csv     (messy on purpose: $ signs, mixed case, commas)
       ├─ sales_february.csv    (different column names & date format)
       ├─ product_prices.csv    (price lookup table)
       └─ PIPELINE.md
```

## The two tracks

- **Infra — Describe infrastructure in plain English:** turn `infra/architecture-brief.md`
  into a plan, generate `main.bicep`, get the deploy/validate/destroy commands, and
  paste `sample-error.txt` to fix a failed deployment — all in plain English.
- **Data — ETL, then query:** clean and merge the messy `data/` exports into one table,
  join the price list, and immediately run SQL on the result.

Each folder's README has a short, in-room demo flow and prompt starters.

## About the data

All names, emails, and numbers are **fictitious**. People (Megan Bowen, Adele Vance,
Alex Wilber, Diego Siciliani) and the company **Contoso** are Microsoft's standard
sample identities. There is **no real personal data** in this repository.

## Tips

- No setup or installs are required to *read* these files.
- If a track asks you to *run* or *deploy* something, a coach will help — or Copilot will give you the one command to use.
- Always work on a **copy** of real data, and validate infrastructure before you deploy.

## License

[MIT](LICENSE) — free to use, copy, and adapt for your own workshops.
