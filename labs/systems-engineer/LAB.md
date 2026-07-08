# Systems Engineer lab — build an Azure environment by *talking* to Copilot

**This lab is about one skill: describing what you want to GitHub Copilot and
letting it do the work.** You won't memorise commands or write code. You'll have a
conversation — Copilot writes the template, runs the commands, and fixes the
errors, while **you** stay in charge and approve each step.

**Time:** about 45 minutes. **You need no coding experience.**

> ### 👉 First time? Do the setup first.
> If you haven't installed the tools, got the files, and signed into Azure yet,
> open **[`SETUP.md`](../../SETUP.md)** (in the top folder) and do those steps.
> Come back here when `az account show` printed your subscription.

> **The rhythm you'll repeat — "the loop":**
> **Prompt** (say what you want) → **Suggestion** (Copilot drafts/does it) →
> **Run** (it runs, you approve) → **Refine** (ask for one change) →
> **Sanity-check** (confirm it's right). You go round until it's right, and **you**
> decide when it is.

---

## The one thing to set up: Copilot **Agent mode**

The magic today is that Copilot can not only *write* things, it can *do* them —
run commands, create files, deploy to Azure — right from the chat. For that, put
Copilot Chat into **Agent mode**:

1. Open Copilot Chat (speech-bubble icon, or **Ctrl+Alt+I**).
2. At the top or bottom of the chat box there's a mode dropdown — set it to
   **Agent**.
3. Now, when you ask for something, Copilot will show you the command or file it
   wants to run and **wait for you to approve** (a **Continue** / **Allow**
   button). **Read what it proposes, then approve.** That approval is you staying
   in control.

> Throughout this lab, a line in quotes like *"Do X"* means: **type it into
> Copilot Chat (Agent mode) and press Enter**, then approve what it proposes. You
> almost never type commands yourself.

---

## What you'll build

A tiny Contoso "sandbox" in Azure — its own **resource group** holding a
**network**, a small **Linux virtual machine**, and a **private storage account**
— then you delete it. The plain-English description is in
**[`architecture-brief.md`](architecture-brief.md)**; you'll point Copilot at it.

---

## Step 1 — Ask Copilot to make a plan

Open the `labs/systems-engineer` folder in VS Code so Copilot can see the files.
Then, in Copilot Chat (Agent mode), ask:

> *"Read the file `architecture-brief.md` in this folder. In plain English, tell me
> what environment it describes, what each piece is for, and how they connect.
> Don't build anything yet."*

Read it back. You've just turned a paragraph of intent into a plan — no code.

## Step 2 — Ask Copilot to write the template

> *"Fill in `main.bicep` from that brief: a virtual network with a subnet, a
> firewall rule that only allows SSH from my own IP, a small Ubuntu Linux VM with
> a public IP, and a private storage account. Don't add any role assignments — I
> only have Contributor. Explain what you did in a few bullets."*

Copilot writes the file and explains it. If any part is unclear, just ask:
*"Explain that section like I've never seen the cloud before."*

## Step 3 — Ask Copilot to sort out the access details

The template needs your internet address and a login key for the VM. Instead of
figuring that out yourself, ask:

> *"Find my current public IP address, create an SSH key for me if I don't have
> one, and create a `main.parameters.json` filled in with those values, an admin
> username, and a sensible VM size. Walk me through anything you run."*

Copilot will propose the commands (finding your IP, making the key) and the file —
**approve each one**. This is the workshop in a nutshell: you asked in English, it
did the fiddly parts.

## Step 4 — Ask Copilot to deploy it (approve as it goes)

> *"Create a resource group with a **unique name** (add a random number so it
> doesn't clash with other people) in the **Sweden Central** region. Show me a
> preview (what-if) of what will be created, and if it looks right, deploy my
> template into it. Tell me the resource group name you chose."*

Copilot will run the `what-if` preview first — **read it**, then approve the real
deployment. It takes a couple of minutes. **Note the resource group name Copilot
tells you** (you'll want it at teardown).

> **Something goes red?** That's normal and it's the fun part — jump to Step 6,
> then come back.

## Step 5 — Ask Copilot to show you what you made

> *"List everything you just created in that resource group, and explain in five
> simple bullets what each thing is and roughly what it would cost per day."*

*(If you'd like to see it yourself, you can run a quick check in the terminal —
this is a validation command, not something to memorise:)*

```powershell
az resource list --resource-group <the-name-Copilot-chose> --output table
```

## Step 6 — Practise fixing a failure (pure Copilot)

This is the most useful skill of the day. Open **`sample-error.txt`**, copy one
error, paste it into Copilot Chat and ask:

> *"I got this error deploying. Explain it in plain English and make the smallest
> fix — don't rewrite my whole template. Then try the deployment again."*

Do it for two or three of the errors. Notice you never needed to understand the
jargon — you described the problem, Copilot fixed the one thing and re-ran it.

## Step 7 — Ask Copilot to tear it all down (do NOT skip) 🧹

> *"Delete the resource group you created for me so nothing keeps costing money,
> and confirm when it's gone."*

Approve it. To double-check it's really being deleted, you can validate yourself:

```powershell
az group exists --name <the-name-Copilot-chose>
```

`false` means it's gone. 🎉 You just built and destroyed a real cloud environment
entirely by describing what you wanted.

---

## If you finish early (keep the conversation going)

- *"Convert this Bicep to Terraform and tell me what changed and why."*
- *"Look at my template — what could cost money or be insecure? Rank the risks and
  fix the top one."*
- *"Add a rule that blocks the VM from reaching the internet, and redeploy."*

## The rules that keep you safe

- **You approve every action.** Copilot proposes; you read it and click Continue.
- **Preview before you build** — always let the `what-if` preview run first.
- **You only have Contributor** — if Copilot ever adds a "role assignment", tell
  it to remove it.
- **Never paste** real passwords, keys, or your subscription ID into the chat.
- **Always tear down** at the end (Step 7).
