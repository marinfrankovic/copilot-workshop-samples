# Systems Engineer lab — build a small Azure environment by describing it

**You will not write any code by hand.** You'll describe what you want in plain
English, GitHub Copilot will draft it, and you'll check it and run it. By the end
you'll have created a small, real environment in Azure — a network, a virtual
machine, and storage — and then deleted it again.

**Time:** about 45 minutes. **You need no coding experience.**

> ### 👉 First time? Do the setup first.
> If you haven't installed the tools, cloned the repo, and signed into Azure yet,
> open **[`SETUP.md`](../../SETUP.md)** (in the top folder) and do those 6 steps.
> Come back here when `az account show` printed your subscription. This lab
> assumes that's done.

> **The rhythm you'll repeat the whole time — "the loop":**
> **Prompt** (say what you want) → **Suggestion** (Copilot drafts it) →
> **Run** (try it) → **Refine** (ask for one change) → **Sanity-check** (make
> sure it's right). You go round until it's right, and **you** decide when it is.

---

## What you'll build

A tiny Contoso "sandbox" that lives in its own **resource group** (think: a
labelled box that holds everything, so it's easy to delete later):

- a **virtual network** (a private network),
- a **firewall rule** that only lets *you* connect,
- a small **Linux virtual machine** (a computer in the cloud),
- a **storage account** (a private place to keep files).

The full plain-English description is in
**[`architecture-brief.md`](architecture-brief.md)** — you'll point Copilot at it.

---

## How to do each step

Every step is either **"ask Copilot"** or **"run a command"**.

- **Ask Copilot** = type the sentence into the **Copilot Chat** box (speech-bubble
  icon, or **Ctrl+Alt+I**) and press Enter. Read what it says. If you're unsure,
  ask it to explain.
- **Run a command** = type it into the **terminal** at the bottom of VS Code
  (open one with **Terminal ▸ New Terminal**), then press Enter.

Take your time. Read what comes back before moving on. Nothing here can hurt
anything outside your own sandbox.

---

## Step 1 — Open the right folder

In VS Code's left sidebar, click into **`labs`** → **`systems-engineer`** so you
can see `architecture-brief.md`, `main.bicep`, and `sample-error.txt`. Having
these visible lets Copilot read them.

## Step 2 — Ask Copilot to make a plan (Prompt → Suggestion)

Open Copilot Chat and paste this exactly:

> *"Read the file `architecture-brief.md` in this folder. In plain English, list
> the pieces of the environment it describes, what each one is for, and how they
> connect. Don't write any code yet."*

Read the plan it gives you. This is what you're about to build.

## Step 3 — Ask Copilot to write the template (Suggestion)

Now have it fill in the (nearly empty) `main.bicep` file. A **Bicep file** is just
a recipe that tells Azure what to create. Paste this:

> *"Open `main.bicep` in this folder and fill it in based on
> `architecture-brief.md`: a virtual network with one subnet, a firewall rule
> (network security group) that only allows SSH from the `allowedSshSourceIp`
> parameter, a public IP, a small Ubuntu Linux virtual machine, and a private
> storage account. Add helpful comments. Do NOT add any role assignments — I only
> have Contributor permissions."*

You don't need to understand every line. If a part looks confusing, ask:
*"Explain that section in plain English."*

## Step 4 — Get the details Copilot needs from you

The template needs two things about you: your internet address, and a "key" to
log into the VM. Run these in the terminal, one at a time:

```powershell
# Your current public IP address (the firewall will only allow YOU in)
(Invoke-RestMethod https://api.ipify.org)
```
```powershell
# Make a login key for the VM (just press Enter through every question)
ssh-keygen -t rsa -b 4096 -f "$HOME\.ssh\contoso_sandbox"
```
```powershell
# Show the public half of that key (you'll paste this when asked)
Get-Content "$HOME\.ssh\contoso_sandbox.pub"
```

Keep the IP address and the key text handy for the next step.

## Step 5 — Ask Copilot for a settings file and the commands (Suggestion)

> *"Create a `main.parameters.json` file for this template, and give me the exact
> Azure CLI commands to (1) preview what will be created, (2) actually create it,
> and (3) delete it all later. I'll fill in my IP address and SSH public key."*

Open the new `main.parameters.json`, and where it asks for the IP and the SSH key,
paste the values from Step 4. Save the file (**Ctrl+S**).

## Step 6 — Preview first, then create it (Run)

**Always preview before you build.** First make the "box" (resource group), then
ask Azure to show you what *would* happen — nothing is created yet:

```powershell
az group create --name rg-contoso-sandbox --location westeurope
```
```powershell
az deployment group what-if --resource-group rg-contoso-sandbox --template-file main.bicep --parameters main.parameters.json
```

Read the list of what it will create. If it looks reasonable, build it for real
(this takes a couple of minutes):

```powershell
az deployment group create --resource-group rg-contoso-sandbox --template-file main.bicep --parameters main.parameters.json
```

> **See a red error?** Good — that's normal. Copy the whole thing, paste it into
> Copilot Chat, and ask: *"Explain this error in plain English and give me the
> smallest fix. Don't rewrite my whole template."* Then try again. This is Step 8
> come early.

## Step 7 — Check what you made (Sanity-check)

See everything that got created:

```powershell
az resource list --resource-group rg-contoso-sandbox --output table
```

Then ask Copilot: *"Explain in five simple bullets what I just created in Azure,
and roughly what it would cost per day if I left it running."*

## Step 8 — Practise fixing a failure (Refine → Sanity-check)

Real deployments fail sometimes, and fixing them is the skill. Open
**`sample-error.txt`**, copy the first error, paste it into Copilot Chat and ask:

> *"Explain this deployment error in plain English and give me the smallest fix.
> Don't rewrite my whole template."*

Try it with a couple of the errors in that file. Notice you don't need to
understand the jargon — you paste, you read the plain-English answer, you fix the
one thing.

## Step 9 — Tear it all down (do NOT skip this) 🧹

This deletes everything you made so it stops costing money. Run:

```powershell
az group delete --name rg-contoso-sandbox --yes --no-wait
```

Check it's being removed (this should say `false` after a minute or two):

```powershell
az group exists --name rg-contoso-sandbox
```

You're done. You just built and destroyed a real cloud environment by describing
it in plain English. 🎉

---

## If you finish early (optional)

Ask Copilot any of these:

- *"Convert this Bicep to Terraform and tell me what changed."*
- *"What in this template could cost money or be insecure? Rank the risks."*
- *"Explain this whole template to me like I've never seen the cloud before."*

## The rules that keep you safe

- **Preview before you build** — always run the `what-if` command first.
- **You only have Contributor** — that's on purpose. If Copilot ever adds a "role
  assignment", tell it to remove it.
- **Never paste** real passwords, keys, or your subscription ID into Copilot Chat.
- **Always tear down** at the end (Step 9).
- **You're in charge.** Copilot drafts; you decide what actually runs.
