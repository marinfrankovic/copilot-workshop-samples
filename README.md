# Copilot Workshop — Sample Files (Infra + Data Edition)

Hands-on files for the session **"GitHub Copilot for non-coders, by role"**. You
describe what you want in plain English, GitHub Copilot drafts it, and you stay in
control. **No coding experience needed.**

## Start here: choose your workshop path

Open **[`START-HERE.md`](START-HERE.md)** first, then choose one path:

- **GitHub Codespaces**: browser-based, nothing to install. Use Copilot CLI in
  the terminal; sidebar Chat is disabled for the workshop.
- **GitHub Copilot app for Windows**: install the desktop app, then work in an
  Interactive session. Download it from <https://gh.io/copilot-app-win64>.

Both paths use the same workshop labs and prompts.

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

> **The whole point is the conversation with Copilot.** You give Copilot tasks in
> plain English through the `copilot` terminal command. It writes code and runs
> commands only after your approval. You describe outcomes in plain English; you
> rarely type commands yourself beyond sign-in and double-check commands.
>
> You can do the workshop two ways:
>
> - **GitHub Codespaces**: nothing to install; Copilot Chat is disabled and you
>   use the `copilot` terminal command.
> - **GitHub Copilot app for Windows**: download it from
>   <https://gh.io/copilot-app-win64>, then start an Interactive session.

## What you need

- A laptop with a web browser and a **GitHub account**. Your **facilitator
  provides GitHub Copilot access** — if you don't already have it, they add it to
  your account, so you just sign in.
- An **Azure subscription** — your facilitator **always provides this**: they
  **invite you** to theirs and give you the **subscription ID** and **Contributor**
  access. That's all the access you need — no admin rights.
- Either **GitHub Codespaces** or the **GitHub Copilot app for Windows**,
  covered step by step in [`SETUP.md`](SETUP.md).

## Pick your track

- **Systems Engineer** → [`labs/systems-engineer/LAB.md`](labs/systems-engineer/LAB.md)
- **Data Engineer** → [`labs/data-engineer/LAB.md`](labs/data-engineer/LAB.md)

## What's in here

```
.
├─ SETUP.md                    ← START HERE: get set up, step by step
├─ CODESPACES.md               ← START HERE in a browser: tools + Copilot CLI
├─ .devcontainer/              ← Makes a GitHub Codespace ready-to-go (tools pre-installed)
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
- **Never paste** secrets, keys, or your subscription ID into Copilot.
- **Tear everything down** at the end of your lab, so nothing keeps costing money.

## License

[MIT](LICENSE) — free to use, copy, and adapt for your own workshops.
