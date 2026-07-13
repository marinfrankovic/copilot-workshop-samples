# Setup — start here (no experience needed)

This page gets you ready. **You don't need to know how to code.** The workshop
runs in **GitHub Codespaces**, so every workshop tool is available in your
browser. When you reach the end, you'll pick a track and open its `LAB.md`.

> **What your facilitator gives you (they always provide these):**
> 1. **GitHub Copilot access** on your GitHub account. If you don't already have
>    Copilot, your facilitator adds it — you just sign in with your GitHub account.
> 2. An **Azure subscription ID** (a long code like
>    `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`) and an **email invite** to that
>    subscription with **Contributor** access. Accept the invite (check your
>    email, click **Accept**) before you start.
>
> Write your subscription ID here so it's handy: `________________________________`

---

# GitHub Codespaces (nothing to install)

A Codespace is a ready-made workspace that runs in your browser. The tools you
need — **Copilot CLI, Azure CLI, Bicep, and Python** — are already installed for
you. Copilot Chat is disabled for this workshop; you work with Copilot in the
terminal.

## Step 1 — Open the workshop in a Codespace
1. In your browser, go to
   <https://github.com/marinfrankovic/copilot-workshop-samples>.
2. Sign in with the **GitHub account** your facilitator gave Copilot access to.
3. Click the green **Code** button → the **Codespaces** tab → **Create codespace
   on main**.
4. Wait a minute while it sets up. A full editor opens **in your browser** — no
   installs needed. ☕

## Step 2 — Start Copilot in the terminal
1. Open **Terminal > New Terminal**.
2. Run `copilot`.
3. Trust the workshop folder when asked. If prompted, enter `/login` and complete
   the GitHub sign-in flow with the account that has Copilot access.
4. Copilot asks before it writes files or runs commands. Read each proposed action
   and choose **Yes** only when it is appropriate.

## Step 3 — Sign into Azure
Exit Copilot with `Ctrl+C`, then run these commands in the terminal. Paste the
subscription ID your facilitator gave you between the quotes:

```bash
az login --use-device-code
az account set --subscription "PASTE-YOUR-SUBSCRIPTION-ID-HERE"
az account show --output table
```

The first command prints a short code and the link
<https://microsoft.com/devicelogin>. Open the link, enter the code, and sign in
with the account your facilitator invited. When the last command prints your
subscription name, restart Copilot with `copilot`.

## Pick your track and open its lab

- **Systems Engineer** (build an Azure environment):
  [`labs/systems-engineer/LAB.md`](labs/systems-engineer/LAB.md)
- **Data Engineer** (clean data and ship it to Azure):
  [`labs/data-engineer/LAB.md`](labs/data-engineer/LAB.md)

To read your lab guide, open it on GitHub in your browser (links above), or just
ask Copilot: *"Show me the file `labs/systems-engineer/LAB.md`."*

Now follow your lab top to bottom in the Copilot terminal. Coaches are in the
room — wave one over anytime.

> **A note on "ask Copilot":** everywhere in the labs, a line in quotes like
> *"Do X"* means **type it into the Copilot terminal** and press Enter, then read
> and approve what it proposes. The whole workshop is this conversation; you
> rarely type commands yourself.
>
> **Got an error at any point?** Paste the whole error back into Copilot and ask
> *"What does this mean and how do I fix it?"* — that's the loop you'll use all
> session.
