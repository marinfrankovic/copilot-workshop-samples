# Data Engineer lab — messy CSVs to a clean table, then ship it to Azure

**Persona:** Megan Bowen, data engineer.
**You'll spend ~50 minutes** using GitHub Copilot to turn three messy CSV exports
into one clean, queryable table, run live SQL on it, and then **push the clean
file up to Azure storage** — all by describing each step in plain English. You
never hand-write the pipeline; you run it on copies and confirm the numbers.

> **The loop, every step:** Prompt → Suggestion → Run → Refine → Sanity-check.

---

## What you'll build

1. A Python pipeline that cleans and merges `sales_january.csv` +
   `sales_february.csv` into one tidy `sales_clean.csv` (originals untouched).
2. Live **SQL** answers over the cleaned data (revenue by region, by month).
3. A join to `product_prices.csv` to compare actual price vs list.
4. The clean file **uploaded to an Azure Storage account** you create — then
   torn down.

---

## Before you start (5 min)

You need:

- **VS Code** with **GitHub Copilot** (Chat, Agent mode) signed in.
- **Python 3** (`python --version`). SQLite is built in.
- The **Azure CLI** (`az`) for the ship step.
- **Contributor** on a subscription *or* a resource group. **You do not need
  Owner** — the upload uses the storage account key, not a role assignment.

Open this folder in VS Code (**File ▸ Open Folder**) so Copilot can see the CSVs.
Skim the three files once so you can see how messy they are.

Sign in (you'll need this at Step 6):

```powershell
az login
az account show --output table
```

---

## Step 1 — Spot the problems first (Prompt → Suggestion)

Open Copilot Chat and ask:

> *"Look at the 3 CSVs in this folder. List every difference and data-quality
> issue I must handle before merging them — column names, date formats, number
> formatting, casing, whitespace, duplicates."*

Read the list. This is your spec for the cleanup.

## Step 2 — Generate the cleanup pipeline (Suggestion)

> *"Write a Python script `clean_sales.py` that reads all three CSVs, normalises
> the column names and the two date formats to ISO, cleans revenue to a real
> number (strip `$` and commas), trims and title-cases names, standardises the
> region casing, and writes a new `sales_clean.csv`. Do NOT overwrite the
> originals. Comment each step."*

## Step 3 — Read it, then run it (Run)

Skim the script first. If it's long, ask:

> *"Explain this pipeline in 5 bullets before I run it, and confirm it only
> writes new files."*

Then run it:

```powershell
python clean_sales.py
```

## Step 4 — Load into SQL and query (Run)

> *"Load `sales_clean.csv` into an in-memory SQLite table and run queries for
> total revenue by region and by month. Print the results as a table."*

Run it and read the numbers.

## Step 5 — Refine: join the price list (Refine)

> *"Join `product_prices.csv` and add a `discount_vs_list` column — the actual
> unit price versus the list price. Show the 5 biggest discounts."*

## Step 6 — Sanity-check (Sanity-check)

> *"Print row count, the date range, 3 sample rows, and total revenue before and
> after cleaning, so I can trust the result."*

Do the totals look right? Did every revenue value parse to a number? If anything
is off, tell Copilot exactly what and ask for the smallest fix.

---

## Step 7 — Ship it to Azure (Run)

Now push the clean file up to a storage account you create. This uses the account
**key** (which Contributor can read) — **no role assignment needed**.

Ask Copilot for the commands, or use these:

```powershell
# 1. Create a resource group and a private storage account (name must be globally unique)
az group create -n rg-contoso-data-megan -l westeurope --tags env=sandbox owner=megan

$sa = "contosodata$((Get-Random -Maximum 99999))"
az storage account create -n $sa -g rg-contoso-data-megan `
  -l westeurope --sku Standard_LRS --allow-blob-public-access false

# 2. Grab the account key (Contributor can do this — no RBAC)
$key = az storage account keys list -n $sa -g rg-contoso-data-megan --query "[0].value" -o tsv

# 3. Create a container and upload the clean file
az storage container create -n reports --account-name $sa --account-key $key
az storage blob upload --account-name $sa --account-key $key `
  -c reports -f sales_clean.csv -n sales_clean.csv

# 4. Confirm it's there
az storage blob list -c reports --account-name $sa --account-key $key --output table
```

Ask Copilot: *"Explain what these commands did in five bullets, and confirm the
storage account is private."*

---

## Step 8 — Tear it down (do not skip)

```powershell
az group delete -n rg-contoso-data-megan --yes --no-wait
az group exists -n rg-contoso-data-megan
```

> If you used a **facilitator-provided** resource group you can't delete, ask
> Copilot for a command to delete just the storage account, or tell your coach.

---

## Stretch goals (if you finish early)

- *"Give me one query that ranks reps by total revenue per region."*
- *"Validate that every revenue value parsed to a number; show me any rows that failed."*
- *"Rewrite the query layer to use DuckDB instead of SQLite and tell me what changed."*
- *"Generate a SAS URL so a teammate can download the uploaded file for 1 hour."*

## Safety

- Write to **new** files only — keep the source CSVs untouched.
- **Read the script before you run it.** Sanity-check the totals.
- Keep the storage account **private**; no real secrets or PII in prompts.
- **Tear down** the resource group when you're done. You own the result.
