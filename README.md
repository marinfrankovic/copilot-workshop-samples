# Copilot Workshop — Sample Files (Infra + Data Edition)

Hands-on files for the session **"GitHub Copilot for non-coders, by role"**. You
describe what you want in plain English, GitHub Copilot drafts it, and you stay in
control. **No coding experience needed.**

## 🚀 New here? Start with [`SETUP.md`](SETUP.md)

**[`SETUP.md`](SETUP.md)** walks you through everything, step by step: installing
the tools, signing into GitHub Copilot, downloading these files, and connecting to
Azure with the subscription your facilitator invited you to. Do that first, then
pick a track below.

## Format: 10 minutes of talk, 50 minutes of hands-on

The facilitator talks for ~10 minutes to show you the idea and one live "magic
moment". Then **you** spend ~50 minutes doing it yourself:

- **Systems engineers** describe an environment in plain English and **create a
  real little Azure environment** — a network, a virtual machine, and storage —
  then delete it.
- **Data engineers** turn three messy spreadsheets into one clean, searchable
  table, ask it questions, and **upload the result to Azure**, then delete it.

The rhythm in every track is
**Prompt → Suggestion → Run → Refine → Sanity-check.**

> **The whole point is the conversation with Copilot.** You use Copilot Chat in
> **Agent mode**, where it writes the code *and* runs the commands and deploys —
> showing you each step and waiting for your approval. You describe outcomes in
> plain English; you rarely type a command yourself (a few sign-in and
> double-check commands aside).

## What you need

- A laptop and a **GitHub account with a Copilot licence** (your facilitator
  confirms this).
- An **Azure subscription** — your facilitator **invites you** to theirs and gives
  you the **subscription ID** and **Contributor** access. That's all the access
  you need — no admin rights.
- A little time to install free tools (all covered in [`SETUP.md`](SETUP.md)).

## Pick your track

- **Systems Engineer** → [`labs/systems-engineer/LAB.md`](labs/systems-engineer/LAB.md)
- **Data Engineer** → [`labs/data-engineer/LAB.md`](labs/data-engineer/LAB.md)

## What's in here

```
.
├─ SETUP.md                    ← START HERE: get your laptop ready, step by step
├─ magic-moment/               ← The facilitator's opening demo (a mystery log)
│   ├─ server.log
│   └─ README.md
└─ labs/
   ├─ systems-engineer/        ← Build a small Azure environment by describing it
   │   ├─ LAB.md                  (your step-by-step guide — start here)
   │   ├─ architecture-brief.md   (the plain-English description you'll point Copilot at)
   │   ├─ main.bicep              (an almost-empty file Copilot fills in)
   │   ├─ sample-error.txt        (real errors to practise fixing)
   │   └─ README.md
   └─ data-engineer/           ← Clean messy data, ask it questions, ship to Azure
       ├─ LAB.md                  (your step-by-step guide — start here)
       ├─ sales_january.csv       (messy on purpose)
       ├─ sales_february.csv      (different columns & dates)
       ├─ product_prices.csv      (a tidy price list)
       └─ README.md
```

## About the data

All names, emails, and numbers are fictitious. People (Megan Bowen, Adele Vance,
Alex Wilber, Diego Siciliani) and the company Contoso are Microsoft's standard
sample identities. There is no real personal data here.

## The golden rules

- **You own the result**, not Copilot. It drafts; you check and decide.
- **Preview before you build** (`what-if`), and **work on copies** of data.
- **Never paste** secrets, keys, or your subscription ID into Copilot Chat.
- **Tear everything down** at the end of your lab, so nothing keeps costing money.

## License

[MIT](LICENSE) — free to use, copy, and adapt for your own workshops.
