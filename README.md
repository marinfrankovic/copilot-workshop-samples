# Copilot Workshop — Sample Files (Infra + Data Edition)

Sample files for the 1-hour session **"GitHub Copilot for non-coders, by role"** —
Infrastructure and Data people describing what they want in plain English and
getting real artefacts back (no deep coding background required).

## About this workshop

From idea to done — in plain English. In one focused, fast-moving hour, discover
how GitHub Copilot turns everyday technical work into something you can simply
describe out loud and watch come to life — no deep coding background required.
We'll go from a blank screen to real, working results through a handful of live
demos, with you in the driver's seat and firmly in control the whole way —
validating before anything goes live and keeping a close eye on the numbers.
You'll pick up a simple, repeatable rhythm you can apply the moment you're back
at your desk, whether you're untangling a messy export, spinning up an environment
from scratch, or just tired of doing the same fiddly pipeline by hand. If you live
close to the data or close to the infrastructure, you'll feel right at home. Come
curious, bring a laptop, and leave with a fresh, practical way to get more done
with less friction.

Open this whole folder in VS Code (**File ▸ Open Folder**) so Copilot can see the files.

```
.
├─ magic-moment/          ← Opener demo: make sense of a mystery log
│   ├─ server.log
│   └─ README.md
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

## The opener + two tracks

- **Magic moment — Make sense of a mystery log:** point Copilot at `magic-moment/server.log`
  and get an instant plain-English diagnosis plus a clean, structured table — the
  fast "wow" that opens the session for both audiences.
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
