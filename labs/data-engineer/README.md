# Data Engineer track — clean messy data, then ship it to Azure

**Goal:** turn three messy CSV exports into one clean table, **query** it with
SQL, then **push the clean result up to Azure storage** — without hand-writing
the pipeline. You describe each step; Copilot writes it; you run and check.

> **Start here:** open [`LAB.md`](LAB.md) and follow it top to bottom (~45 min).
>
> **Never used these tools before?** Do [`SETUP.md`](../../SETUP.md) in the top
> folder first (start Codespaces, sign into Copilot and Azure), then
> open `LAB.md`.

## Files (deliberately messy, like real exports)
- [`sales_january.csv`](sales_january.csv) — `$` signs, commas inside numbers
  (`$1,188.00`), mixed-case names/regions, trailing spaces.
- [`sales_february.csv`](sales_february.csv) — **different column names**
  (`date,rep,region,product,units,revenue`) and a **different date format**
  (`MM/DD/YYYY`).
- [`product_prices.csv`](product_prices.csv) — clean list-price lookup to join on.
- [`LAB.md`](LAB.md) — the step-by-step, self-guided lab.

## What you'll build (Extract → Transform → Load → Query → Ship)
You do all of this by **talking to Copilot** — it writes and runs the code, you
check the numbers and approve each step.
1. **Extract:** ask Copilot to read all three CSVs.
2. **Transform:** ask it to normalise column names, dates, and money, and title-case names.
3. **Load:** it writes a clean `sales_clean.csv` — never overwriting the originals.
4. **Query:** describe questions in English; Copilot writes and runs the SQL.
5. **Ship:** ask it to create a private Azure Storage account and **upload the
   clean file**, then tear it down.

## What you need
- A **GitHub Codespace** started from this repository, following
  [`CODESPACES.md`](../../CODESPACES.md).
- Python 3 (SQLite ships with it) and Azure CLI (`az`) — already present in the
  Codespace.
- An Azure subscription your facilitator **provides and invites you to**, with
  **Contributor** access and the **subscription ID** they gave you. **No Owner
  needed** — the upload uses the storage account key, not a role assignment.

## Safety
- Write to **new** files only; keep the source CSVs untouched.
- Read the script before running it. Sanity-check the totals.
- Delete the resource group when you finish. You own the result.
