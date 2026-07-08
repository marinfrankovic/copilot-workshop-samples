# Data Engineer lab — clean data and ship it by *talking* to Copilot

**This lab is about one skill: describing what you want to GitHub Copilot and
letting it do the work.** You won't write code or memorise commands. You'll have a
conversation — Copilot writes the cleanup, runs it, answers your questions with
SQL, and uploads the result to Azure, while **you** check the numbers and stay in
charge.

**Time:** about 45 minutes. **You need no coding experience.**

> ### 👉 First time? Do the setup first.
> If you haven't installed the tools (including **Python**), got the files, and
> signed into Azure yet, open **[`SETUP.md`](../../SETUP.md)** (in the top folder)
> and do those steps. Come back when `az account show` printed your subscription.

> **The rhythm you'll repeat — "the loop":**
> **Prompt** (say what you want) → **Suggestion** (Copilot writes/does it) →
> **Run** (it runs, you approve) → **Refine** (ask for one change) →
> **Sanity-check** (confirm the numbers). You go round until it's right.

---

## The one thing to set up: Copilot **Agent mode**

The magic today is that Copilot can not only *write* code, it can *run* it — clean
your files, run queries, upload to Azure — right from the chat. For that, put
Copilot Chat into **Agent mode**:

1. Open Copilot Chat (speech-bubble icon, or **Ctrl+Alt+I**).
2. Set the mode dropdown to **Agent**.
3. When you ask for something, Copilot shows the program or command it wants to
   run and **waits for you to approve** (a **Continue** / **Allow** button).
   **Read it, then approve.** That's you staying in control.

> Throughout this lab, a line in quotes like *"Do X"* means: **type it into
> Copilot Chat (Agent mode) and press Enter**, then approve what it proposes. You
> almost never type commands yourself.

---

## What you'll build

Three messy spreadsheets → one clean table → answers to real questions → the clean
file uploaded to Azure — then deleted. The starter files are already in this
folder: `sales_january.csv`, `sales_february.csv`, `product_prices.csv`.

---

## Step 1 — Ask Copilot what's wrong with the data

Open the `labs/data-engineer` folder in VS Code so Copilot can see the files.
Then, in Copilot Chat (Agent mode), ask:

> *"Look at the 3 CSV files in this folder. In plain English, list everything
> that's messy or inconsistent — different column names, date formats, dollar
> signs, commas in numbers, capitalisation, extra spaces — that I'd need to fix
> before combining them."*

Read the list. That's your to-do list — and Copilot will do it for you.

## Step 2 — Ask Copilot to clean and combine the data

> *"Write a Python program that fixes every issue you just listed, combines
> January and February into one tidy table, and saves it as a new file
> `sales_clean.csv`. Do not change my original files. Then run it, and tell me in
> five simple bullets what it did."*

Copilot writes the program **and** runs it (approve when it asks). A new
`sales_clean.csv` appears. Click it to look.

> **Something goes red?** Just say: *"That errored — explain it simply and fix
> it."* Copilot sorts it out and runs it again.

## Step 3 — Ask questions with plain English (Copilot writes the SQL)

You don't need to know SQL — describe the question:

> *"Using `sales_clean.csv`, show me total revenue by region and total revenue by
> month. Run it and show me the answers as a neat table."*

Read the answers. Ask follow-ups the same way: *"Now show me the top-selling
product."*

## Step 4 — Refine: add the price comparison

> *"Now also use `product_prices.csv` to compare the actual price per unit against
> the list price, and show me the five biggest discounts."*

## Step 5 — Sanity-check (make sure you can trust it)

> *"Show me the number of rows, the range of dates, three example rows, and the
> total revenue before and after cleaning, so I can be sure nothing was lost or
> double-counted."*

Do the before/after totals make sense? If something looks off, say exactly what
and ask Copilot to fix it.

## Step 6 — Ask Copilot to ship it to Azure (approve as it goes)

> *"Create a resource group with a **unique name** (add a random number so it
> doesn't clash with other people) in the **Sweden Central** region, then create a
> **private** storage account in it and upload my `sales_clean.csv` into a
> container. Use the storage account key so I don't need extra permissions. Tell
> me the resource group name you chose, and confirm the storage is private."*

Copilot proposes each command — **read and approve**. **Note the resource group
name** it tells you (you'll want it at teardown).

*(Want to see the uploaded file yourself? That's a fair validation command:)*

```powershell
az storage blob list --container-name reports --account-name <name-Copilot-made> --account-key <key> --output table
```

## Step 7 — Ask Copilot to tear it all down (do NOT skip) 🧹

> *"Delete the resource group you created so nothing keeps costing money, and
> confirm when it's gone."*

Approve it. To double-check yourself:

```powershell
az group exists --name <the-name-Copilot-chose>
```

`false` means it's gone. 🎉 You cleaned real data and shipped it to the cloud —
all by describing what you wanted.

---

## If you finish early (keep the conversation going)

- *"Which sales rep sold the most in each region? Run it."*
- *"Check that every revenue value became a proper number, and show me any rows
  that didn't."*
- *"Make a bar chart of revenue by month, save it as an image, and open it."*

## The rules that keep you safe

- **You approve every action.** Copilot proposes; you read it and click Continue.
- **Work on copies** — your original CSVs are never changed.
- **Read before you run** — ask for the five-bullet summary first.
- **Never paste** real secrets, keys, or your subscription ID into the chat.
- **Always tear down** at the end (Step 7).
