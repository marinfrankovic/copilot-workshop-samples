# Setup — start here (no experience needed)

This page gets you ready. **You don't need to know how to code.** There are two
ways to do the workshop — **GitHub Codespaces** (nothing to install) or the
**GitHub Copilot app** (a desktop app). Your facilitator will tell you which one
to use — just follow that option below. When you reach the end, you'll pick a
track and open its `LAB.md`.

> **What your facilitator gives you (they always provide these):**
> 1. **GitHub Copilot access** on your GitHub account. If you don't already have
>    Copilot, your facilitator adds it — you just sign in with your GitHub account.
> 2. An **Azure subscription ID** (a long code like
>    `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`) and an **email invite** to that
>    subscription with **Contributor** access. Accept the invite (check your
>    email, click **Accept**) before you start.
> 3. **Which path to use** — **GitHub Codespaces** (nothing to install) or the
>    **GitHub Copilot app** (a desktop app). Follow the matching option below.
>
> Write your subscription ID here so it's handy: `________________________________`

---

## Choose your path

Your facilitator will tell you which to use — you only need **one**:

- **Option A — GitHub Codespaces** (easiest: nothing to install, runs in your
  browser). Follow **Option A** below.
- **Option B — GitHub Copilot app** (a desktop app you install once). Skip to
  **Option B** below.

---

# Option A — GitHub Codespaces (nothing to install)

A Codespace is a ready-made workspace that runs in your browser. The tools you
need — **GitHub Copilot, Azure CLI, and Python** — are already installed for you.

## A1 — Open the workshop in a Codespace
1. In your browser, go to
   <https://github.com/marinfrankovic/copilot-workshop-samples>.
2. Sign in with the **GitHub account** your facilitator gave Copilot access to.
3. Click the green **Code** button → the **Codespaces** tab → **Create codespace
   on main**.
4. Wait a minute while it sets up. A full editor opens **in your browser** — no
   installs needed. ☕

## A2 — Say hello to Copilot
1. Click the **Copilot Chat** icon (a speech bubble) in the left sidebar, or press
   **Ctrl+Alt+I** (Mac: **Cmd+Ctrl+I**). Sign in if it asks.
2. At the bottom of the chat box there's a small **mode** dropdown — set it to
   **Agent**. Agent mode lets Copilot *do* things (run commands, create files,
   deploy) — always showing you each step and waiting for your **Continue**. That
   approval is how you stay in control.

## A3 — Sign into Azure (just ask Copilot)
In Copilot Chat, type this — put the subscription ID your facilitator gave you in
place of the placeholder — then press Enter:

> *"Sign me into Azure. I'm working in a browser-based Codespace, so use whatever
> sign-in method works without a local browser. Then switch to the subscription
> with ID `PASTE-YOUR-SUBSCRIPTION-ID-HERE` and show me which account and
> subscription I'm using so I can confirm."*

Copilot shows the commands and asks permission — click **Continue / Allow**. It
prints a short **code** and the link <https://microsoft.com/devicelogin> — open
the link, enter the code, and sign in with the account your facilitator invited.
When Copilot prints your subscription name, you're connected. 🎉

➡️ Now jump to **"Pick your track and open its lab"** at the bottom.

---

# Option B — GitHub Copilot app (desktop)

## B1 — Install a few free tools (do this once)
- **The GitHub Copilot app** — <https://gh.io/app> → get the version for your
  computer, run the installer, keep clicking **Next / Install**. This is where
  you'll do the workshop.
- **Git** (the app needs it) — <https://git-scm.com/downloads> → run the installer
  and keep the defaults. You won't type Git commands yourself.
- **Azure CLI** (to talk to Azure) —
  Windows: <https://aka.ms/installazurecliwindows> ·
  Mac: open **Terminal** and run `brew install azure-cli`
  (Homebrew: <https://brew.sh/>).
- **Python** — **only if you chose the Data track** —
  <https://www.python.org/downloads/> → on Windows, tick **"Add Python to PATH"**
  on the first screen before installing.

> After installing, close and re-open the GitHub Copilot app if it was already
> running, so it notices the new tools.

## B2 — Open the app and sign in
1. Open the **GitHub Copilot app**.
2. Click **Sign in to GitHub** and log in with your **GitHub account** (the one
   your facilitator gave Copilot access to).
3. If it mentions a Copilot plan, you're covered — continue. When it offers to
   pick a repository, you can **skip** for now.
4. Pick a colour theme and finish the short welcome.

There's **no "mode" to switch on** — the app is built to *do* work, not just chat.

## B3 — Add the workshop files
1. In the left sidebar, click the **+** next to **Sessions**.
2. Choose **Add project from → Repository URL**.
3. Paste this and confirm:
   ```
   https://github.com/marinfrankovic/copilot-workshop-samples.git
   ```
4. The app makes its own copy and adds the project to your sidebar.

## B4 — Start a session
1. Click the **+** next to **Sessions** again and pick the
   **copilot-workshop-samples** project.
2. For the **session mode** (the dropdown under the box where you type), choose
   **Interactive** — Copilot works *with* you and pauses for you to approve each
   step. Perfect for beginners.

## B5 — Sign into Azure (just ask Copilot)
In your session, type this — put the subscription ID your facilitator gave you in
place of the placeholder — then press Enter:

> *"Sign me into Azure, then switch to the subscription with ID
> `PASTE-YOUR-SUBSCRIPTION-ID-HERE` and show me which account and subscription I'm
> using so I can confirm."*

Copilot shows the commands and asks permission — click **Continue / Allow**. A
browser window opens; sign in with the account your facilitator invited. When
Copilot prints your subscription name, you're connected. 🎉

---

## Pick your track and open its lab

- **Systems Engineer** (build an Azure environment):
  [`labs/systems-engineer/LAB.md`](labs/systems-engineer/LAB.md)
- **Data Engineer** (clean data and ship it to Azure):
  [`labs/data-engineer/LAB.md`](labs/data-engineer/LAB.md)

To read your lab guide, open it on GitHub in your browser (links above), or just
ask Copilot: *"Show me the file `labs/systems-engineer/LAB.md`."*

Now follow your lab top to bottom, in the **same place** you just set up (your
Codespace's Copilot Chat, or your app session). Coaches are in the room — wave one
over anytime.

> **A note on "ask Copilot":** everywhere in the labs, a line in quotes like
> *"Do X"* means **type it into Copilot** (Codespaces: Copilot Chat in **Agent**
> mode; app: your **Interactive** session) and press Enter — then read and approve
> what it proposes. The whole workshop is this conversation; you rarely type
> commands yourself.
>
> **Got an error at any point?** Paste the whole error back into Copilot and ask
> *"What does this mean and how do I fix it?"* — that's the loop you'll use all
> session.
