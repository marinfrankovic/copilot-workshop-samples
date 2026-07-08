# Setup — start here (no experience needed)

This page gets your laptop ready. **You don't need to know how to code.** Follow
each step in order. It takes about 10–15 minutes the first time. When you reach
the end, you'll pick a track and open its `LAB.md`.

> **Two things your facilitator will give you:**
> 1. Confirmation that your **GitHub account has a Copilot licence**.
> 2. An **Azure subscription ID** (a long code like
>    `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`) and an **email invite** to that
>    subscription with **Contributor** access. Accept the invite (check your
>    email, click **Accept**) before you start.
>
> Write your subscription ID here so it's handy: `________________________________`

---

## Step 1 — Install the tools (do this once)

You need a few free programs. Install the ones for your track (everyone needs the
first three; only the Data track needs Python).

### 1a. Visual Studio Code (the editor) — everyone
- Download: <https://code.visualstudio.com/> → click **Download**, run the
  installer, keep clicking **Next / Install**.

### 1b. Git (to download the workshop files) — everyone
- Download: <https://git-scm.com/downloads> → run the installer, keep the default
  options (just keep clicking **Next**).
- *(If you'd rather not install Git, you can download a ZIP instead — see Step 3,
  Option B.)*

### 1c. Azure CLI (to talk to Azure) — everyone
- **Windows:** download and run <https://aka.ms/installazurecliwindows>
- **Mac:** open the **Terminal** app and paste:
  `brew install azure-cli` (if you don't have Homebrew, see <https://brew.sh/>).

### 1d. Python (only if you chose the **Data** track)
- Download: <https://www.python.org/downloads/> → click the big **Download**
  button, run the installer.
- **Windows: on the first screen, tick the box "Add Python to PATH"** before you
  click Install. This matters.

> **Restart VS Code** (close it and open it again) after installing these, so it
> notices the new tools.

---

## Step 2 — Open VS Code and turn on GitHub Copilot

1. Open **Visual Studio Code**.
2. Look at the left sidebar for the **Copilot / Chat** icon (a speech bubble). If
   you don't see it, or it asks you to sign in, click **Sign in** and log in with
   the **GitHub account** that has your Copilot licence.
3. When it's ready you'll be able to open **Copilot Chat** (the speech-bubble
   icon, or press **Ctrl+Alt+I** on Windows / **Cmd+Ctrl+I** on Mac).
4. **Set the chat to Agent mode.** There's a mode dropdown in the chat box — choose
   **Agent**. This lets Copilot not just *write* things but *do* them (run
   commands, create files, deploy) — always showing you what it's about to do and
   waiting for you to click **Continue**. That approval is how you stay in control.

> Throughout the labs, “**ask Copilot**” means: type the sentence into the Copilot
> Chat box (in **Agent mode**) and press Enter — then read and approve whatever it
> proposes. The whole workshop is this conversation; you rarely type commands
> yourself.

---

## Step 3 — Get the workshop files

Pick **one** option.

### Option A — Clone with VS Code (recommended, needs Git from Step 1b)
1. In VS Code press **Ctrl+Shift+P** (Mac: **Cmd+Shift+P**) to open the command box.
2. Type **`Git: Clone`** and click it.
3. Paste this address and press Enter:
   ```
   https://github.com/marinfrankovic/copilot-workshop-samples.git
   ```
4. Choose a folder to save it in (your **Documents** folder is fine).
5. When VS Code asks **"Would you like to open the cloned repository?"**, click
   **Open**.

### Option B — Download a ZIP (no Git needed)
1. Go to
   <https://github.com/marinfrankovic/copilot-workshop-samples> in your browser.
2. Click the green **Code** button → **Download ZIP**.
3. Find the downloaded file, **right-click → Extract All** (Windows) or
   double-click it (Mac).
4. In VS Code: **File ▸ Open Folder…** and pick the extracted
   `copilot-workshop-samples` folder.

> You'll know it worked when the left sidebar of VS Code shows folders named
> **`labs`** and **`magic-moment`**.

---

## Step 4 — Open a terminal in VS Code

You'll type a few commands into a "terminal". To open one:

- Menu **Terminal ▸ New Terminal** (or press **Ctrl+`** — that's the key above Tab).

A panel opens at the bottom. That's where the commands below go.

---

## Step 5 — Sign into Azure

In that terminal, type these one at a time (press Enter after each):

```powershell
az login
```
A browser window opens — sign in with the account your facilitator invited. Then
point the tools at the right subscription (paste the ID your facilitator gave you
between the quotes):

```powershell
az account set --subscription "PASTE-YOUR-SUBSCRIPTION-ID-HERE"
az account show --output table
```

The last command should print the subscription name and your details. If it does,
you're connected. 🎉

> **Only got an error?** Copy the whole error, open Copilot Chat, paste it, and
> ask: *"I'm setting up the Azure CLI. What does this error mean and how do I fix
> it?"* That's the loop — you'll use it all session.

---

## Step 6 — Pick your track and open its lab

- **Systems Engineer** (build an Azure environment):
  open **`labs/systems-engineer/LAB.md`**
- **Data Engineer** (clean data and ship it to Azure):
  open **`labs/data-engineer/LAB.md`**

To open a file: click it once in the left sidebar. To read it nicely formatted,
right-click the file tab and choose **Open Preview** (or press
**Ctrl+Shift+V**).

Now follow your lab top to bottom. Coaches are in the room — wave one over
anytime.
