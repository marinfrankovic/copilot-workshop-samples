# Copilot Workshop — Sample Files (Infra + Data Edition)

Sample files for the session **"GitHub Copilot for non-coders, by role"** —
systems engineers and data engineers describing what they want in plain English
and getting real artefacts back (no deep coding background required).

## Format: 10 minutes of talk, 50 minutes of hands-on

This session is deliberately lop-sided. The facilitator talks for ~10 minutes to
set the loop and run one live "magic moment", then **you** spend ~50 minutes
actually doing the work:

- **Systems engineers** turn a plain-English brief into Bicep and **deploy a real
  Azure environment** — a resource group with a virtual network, an NSG, a Linux
  VM, and private storage — then tear it down.
- **Data engineers** clean and merge three messy CSV exports into one queryable
  table, run live SQL, and **ship the clean file to Azure storage**, then tear it
  down.

The reusable pattern in every track is
**Prompt → Suggestion → Run → Refine → Sanity-check.**

## What you need

- **VS Code** with **GitHub Copilot** (Chat, Agent mode) signed in.
- The **Azure CLI** (`az`) installed.
- An **Azure subscription** you can deploy into. You only need **Contributor** on
  a subscription or resource group — **no Owner, no elevated rights**. The labs
  never create role assignments.
- For the data lab: **Python 3** (SQLite is built in).

Open this whole folder in VS Code (**File ▸ Open Folder**) so Copilot can see the
files.

```
.
├─ magic-moment/               ← Facilitator opener: make sense of a mystery log
│   ├─ server.log
│   └─ README.md
└─ labs/
   ├─ systems-engineer/        ← Describe an environment → IaC → deploy → tear down
   │   ├─ LAB.md                  (start here — the step-by-step lab)
   │   ├─ architecture-brief.md   (the plain-English brief)
   │   ├─ main.bicep              (almost-empty starter for Copilot to fill)
   │   ├─ sample-error.txt        (realistic deploy errors to fix)
   │   └─ README.md
   └─ data-engineer/           ← Clean messy CSVs → query → ship to Azure storage
       ├─ LAB.md                  (start here — the step-by-step lab)
       ├─ sales_january.csv       (messy on purpose: $ signs, mixed case, commas)
       ├─ sales_february.csv      (different column names & date format)
       ├─ product_prices.csv      (price lookup table)
       └─ README.md
```

## How the hour runs

1. **Intro (10 min)** — the loop, the two personas, one live magic moment
   (`magic-moment/server.log`), and the safety rules.
2. **Hands-on (50 min)** — pick the track closest to your job and follow its
   `LAB.md` top to bottom. Coaches circulate.
3. **Tear down** — every lab ends by deleting the resource group so nothing keeps
   costing money.

## Pick your track

- **Systems Engineer** → [`labs/systems-engineer/LAB.md`](labs/systems-engineer/LAB.md)
- **Data Engineer** → [`labs/data-engineer/LAB.md`](labs/data-engineer/LAB.md)

## About the data

All names, emails, and numbers are fictitious. People (Megan Bowen, Adele Vance,
Alex Wilber, Diego Siciliani) and the company Contoso are Microsoft's standard
sample identities. There is no real personal data in this repository.

## Tips

- No installs are required just to **read** these files.
- Always **validate before you deploy** (`az deployment group what-if`) and
  **run scripts on copies**.
- **Tear everything down** at the end of your lab.
- You only need **Contributor** — if a step seems to need Owner (a role
  assignment), skip it. The labs are written to avoid it.

## License

[MIT](LICENSE) — free to use, copy, and adapt for your own workshops.
