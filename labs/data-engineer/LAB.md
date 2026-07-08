# Data Engineer lab — clean messy data, then put it in Azure

**You will not write any code by hand.** You'll describe what you want in plain
English, GitHub Copilot will write it, and you'll run it and check the numbers. By
the end you'll have turned three messy spreadsheets into one clean table, asked it
questions, and uploaded the result to Azure — then deleted it.

**Time:** about 45 minutes. **You need no coding experience.**

> ### 👉 First time? Do the setup first.
> If you haven't installed the tools (including **Python**), cloned the repo, and
> signed into Azure yet, open **[`SETUP.md`](../../SETUP.md)** (in the top folder)
> and do those 6 steps. Come back here when `az account show` printed your
> subscription. This lab assumes that's done.

> **The rhythm you'll repeat the whole time — "the loop":**
> **Prompt** (say what you want) → **Suggestion** (Copilot writes it) →
> **Run** (try it) → **Refine** (ask for one change) → **Sanity-check** (make sure
> the numbers are right). You go round until it's right.

---

## What you'll build

- One clean, tidy table made from three messy sales files.
- Answers to real questions ("how much did each region sell?") using **SQL** —
  Copilot writes the SQL, you just read the answers.
- The clean file **uploaded to Azure storage**, then deleted.

The three starter files are already in this folder:

- `sales_january.csv` — messy on purpose ($ signs, commas in numbers, odd capitals).
- `sales_february.csv` — different column names and a different date style.
- `product_prices.csv` — a tidy price list to match against.

---

## How to do each step

Every step is either **"ask Copilot"** or **"run a command"**.

- **Ask Copilot** = type the sentence into the **Copilot Chat** box (speech-bubble
  icon, or **Ctrl+Alt+I**) and press Enter.
- **Run a command** = type it into the **terminal** at the bottom of VS Code
  (open one with **Terminal ▸ New Terminal**), then press Enter.

Take your time and read what comes back. You always work on **copies** — the
original files are never changed.

---

## Step 1 — Open the right folder

In VS Code's left sidebar, click into **`labs`** → **`data-engineer`** so you can
see the three `.csv` files. Click one to peek at how messy it is, then close it.

## Step 2 — Ask Copilot what's wrong with the data (Prompt → Suggestion)

Open Copilot Chat and paste:

> *"Look at the 3 CSV files in this folder. In plain English, list everything that
> is messy or inconsistent about them — different column names, different date
> formats, dollar signs, commas inside numbers, capitalisation, extra spaces —
> that I'd need to fix before combining them."*

Read the list. That's your to-do list, and Copilot will do it for you next.

## Step 3 — Ask Copilot to write the cleanup (Suggestion)

> *"Write a Python program called `clean_sales.py` that reads all three CSV files,
> fixes every issue you just listed, combines January and February into one tidy
> table, and saves it as a new file `sales_clean.csv`. Do NOT change the original
> files. Add a comment explaining each step in plain English."*

## Step 4 — Read it, then run it (Run)

First, ask Copilot to reassure you:

> *"In five simple bullets, tell me what this program does and confirm it only
> creates new files and never changes my originals."*

Then run it in the terminal:

```powershell
python clean_sales.py
```

A new file `sales_clean.csv` should appear in the folder. Click it to look.

> **Red error?** Copy it, paste it into Copilot Chat, and ask: *"Explain this
> error simply and give me the smallest fix."* Then run it again.

## Step 5 — Ask questions with SQL (Run)

You don't need to know SQL — Copilot writes it. Paste:

> *"Load `sales_clean.csv` into an in-memory SQLite database and show me total
> revenue by region and total revenue by month. Print the answers as a neat
> table. Give me one program I can run."*

Run whatever file it creates (it'll tell you the command, usually
`python something.py`) and read the answers.

## Step 6 — Add the price comparison (Refine)

> *"Now also use `product_prices.csv` to compare the actual price per unit against
> the list price, and show me the five biggest discounts."*

## Step 7 — Check you can trust it (Sanity-check)

> *"Print the number of rows, the range of dates, three example rows, and the
> total revenue before and after cleaning, so I can be sure nothing was lost or
> double-counted."*

Do the before/after totals make sense? If something looks off, tell Copilot
exactly what and ask for a fix.

## Step 8 — Put the clean file in Azure (Run)

Now upload `sales_clean.csv` to a private storage account you create. Run these in
the terminal, one at a time. (You can also ask Copilot to explain each line.)

```powershell
# 1. Make a "box" (resource group) to hold everything
az group create --name rg-contoso-data --location westeurope
```
```powershell
# 2. Make a private storage account with a unique name
$name = "contosodata$(Get-Random -Maximum 99999)"
az storage account create --name $name --resource-group rg-contoso-data --sku Standard_LRS --allow-blob-public-access false
```
```powershell
# 3. Get the account's access key (you have permission to read this)
$key = az storage account keys list --account-name $name --resource-group rg-contoso-data --query "[0].value" --output tsv
```
```powershell
# 4. Make a container and upload your clean file into it
az storage container create --name reports --account-name $name --account-key $key
az storage blob upload --account-name $name --account-key $key --container-name reports --file sales_clean.csv --name sales_clean.csv
```
```powershell
# 5. Confirm it's really there
az storage blob list --container-name reports --account-name $name --account-key $key --output table
```

Then ask Copilot: *"Explain in five simple bullets what those Azure commands just
did, and confirm the storage is private."*

## Step 9 — Tear it all down (do NOT skip this) 🧹

Delete everything so it stops costing anything:

```powershell
az group delete --name rg-contoso-data --yes --no-wait
```
```powershell
az group exists --name rg-contoso-data
```

That last line should say `false` after a minute or two. Done — you cleaned real
data and shipped it to the cloud, all by describing it. 🎉

---

## If you finish early (optional)

- *"Show me which sales rep sold the most in each region."*
- *"Check that every revenue value turned into a proper number, and show me any
  rows that didn't."*
- *"Make a bar chart of revenue by month and save it as an image."*

## The rules that keep you safe

- **Work on copies** — the original CSVs are never changed.
- **Read before you run** — ask Copilot to explain a program in 5 bullets first.
- **Never paste** real secrets, keys, or your subscription ID into Copilot Chat.
- **Always tear down** at the end (Step 9).
- **You're in charge.** Copilot writes; you check the numbers.
