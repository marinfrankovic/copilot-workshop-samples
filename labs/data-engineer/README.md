# Data Engineer track — clean messy data, then ship it to Azure

**Goal:** turn three messy CSV exports into one clean table, **query** it with
SQL, then **push the clean result up to Azure storage** — without hand-writing
the pipeline. You describe each step; Copilot writes it; you run and check.

> **Start here:** open [`LAB.md`](LAB.md) and follow it top to bottom (~50 min).

## Files (deliberately messy, like real exports)
- [`sales_january.csv`](sales_january.csv) — `$` signs, commas inside numbers
  (`$1,188.00`), mixed-case names/regions, trailing spaces.
- [`sales_february.csv`](sales_february.csv) — **different column names**
  (`date,rep,region,product,units,revenue`) and a **different date format**
  (`MM/DD/YYYY`).
- [`product_prices.csv`](product_prices.csv) — clean list-price lookup to join on.
- [`LAB.md`](LAB.md) — the step-by-step, self-guided lab.

## What you'll build (Extract → Transform → Load → Query → Ship)
1. **Extract:** read all three CSVs.
2. **Transform:** normalise column names; strip `$` and commas from revenue; trim
   and title-case names; standardise region; parse both date formats to ISO.
3. **Load:** write a clean `sales_clean.csv` **and** load it into an in-memory
   SQLite table — never overwrite the originals.
4. **Query:** run SQL immediately — revenue by region, top product, month-over-month.
5. **Ship:** create an Azure Storage account and **upload `sales_clean.csv`** to a
   blob container, then tear it down.

## What you need
- VS Code + GitHub Copilot (Chat, Agent mode).
- Python 3 (SQLite ships with it). Azure CLI (`az`) for the ship step.
- **Contributor** on a subscription or resource group. **No Owner needed** — the
  upload uses the storage account key, not a role assignment.

## Safety
- Write to **new** files only; keep the source CSVs untouched.
- Read the script before running it. Sanity-check the totals.
- Delete the resource group when you finish. You own the result.
