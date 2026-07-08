# Systems Engineer lab — describe an Azure environment, then deploy it

**Persona:** Alex Wilber, systems engineer.
**You'll spend ~50 minutes** using GitHub Copilot to turn a plain-English brief
into infrastructure-as-code, **deploy a real environment to Azure**, fix a
failure, and tear it all down. You never hand-write the template — you describe
what you want, review what Copilot drafts, and stay in control.

> **The loop, every step:** Prompt → Suggestion → Run → Refine → Sanity-check.

---

## What you'll build

A small Contoso **sandbox** in its own resource group:

- a **virtual network** + subnet,
- a **network security group** that only allows SSH from *your* IP,
- a small **Ubuntu Linux VM** with a public IP,
- a **private storage account**,
- tags on everything.

Full spec: [`architecture-brief.md`](architecture-brief.md).

---

## Before you start (5 min)

You need:

- **VS Code** with **GitHub Copilot** (Chat, Agent mode) signed in.
- The **Azure CLI** (`az`) installed.
- **Contributor** on a subscription *or* a resource group. **You do not need
  Owner** — this lab never creates role assignments.

Open this folder in VS Code (**File ▸ Open Folder**) so Copilot can see the brief
and the starter template.

Sign in and pick your subscription:

```powershell
az login
az account show --output table
```

Get the two things the template needs — **your public IP** and an **SSH key**:

```powershell
# Your current public IP (the NSG will only allow SSH from this)
(Invoke-RestMethod https://api.ipify.org)

# Create an SSH key if you don't have one (press Enter through the prompts)
ssh-keygen -t rsa -b 4096 -f "$HOME\.ssh\contoso_sandbox"
Get-Content "$HOME\.ssh\contoso_sandbox.pub"
```

> **Tip:** if you only have Contributor on a **resource group** your facilitator
> created, skip the `az group create` step below and deploy into that group
> instead. Everything else is identical.

---

## Step 1 — Plan first (Prompt → Suggestion)

Open Copilot Chat and ask:

> *"Read `architecture-brief.md` in this folder. List the resources, their names,
> and how they connect — before writing any code. Flag anything that would need
> permissions above Contributor."*

Read the plan. It should call out that **no role assignments** are needed. Good —
that keeps you inside Contributor.

## Step 2 — Generate the Bicep (Suggestion)

> *"Fill in `main.bicep` from the brief: virtual network + subnet, an NSG that
> only allows SSH from the `allowedSshSourceIp` parameter, a public IP, a NIC, a
> small Ubuntu 22.04 VM using the admin username + SSH public key parameters, and
> a private storage account with public blob access disabled. Tag everything. Do
> NOT create any role assignments. Explain each block."*

Skim the result. Ask Copilot to explain any block you don't recognise.

## Step 3 — Get the commands + a parameters file

> *"Create a `main.parameters.json` for this template and give me the exact az
> commands to preview with what-if, deploy, and later destroy everything. I'll
> pass my IP and SSH public key."*

Fill in your values (IP from `ipify`, the contents of `contoso_sandbox.pub`).

## Step 4 — Preview, then deploy (Run)

**Always preview before you deploy.** Create the resource group and run what-if:

```powershell
az group create -n rg-contoso-sandbox-alex -l westeurope --tags env=sandbox owner=alex

az deployment group what-if `
  -g rg-contoso-sandbox-alex `
  --template-file main.bicep `
  --parameters main.parameters.json
```

Read what it will create. If it looks right, drop `what-if` and deploy:

```powershell
az deployment group create `
  -g rg-contoso-sandbox-alex `
  --template-file main.bicep `
  --parameters main.parameters.json
```

## Step 5 — Refine (Refine)

Ask for one improvement at a time, e.g.:

> *"Double-check the NSG only allows SSH from my IP and nothing else is open to
> the internet. Show me the rule."*

> *"Confirm the storage account has public blob access disabled, and add a tag
> `costCenter=demo` to every resource."*

Re-run **what-if**, then deploy again to apply.

## Step 6 — Troubleshoot (Sanity-check)

Open [`sample-error.txt`](sample-error.txt), paste one error into Copilot and ask:

> *"Explain this deployment error in plain English and give me the smallest fix.
> Don't rewrite my whole template."*

Do it for a couple of the errors — a name collision, the policy block, and the
"you only have Contributor" one are the most instructive.

Then sanity-check the real deployment:

```powershell
az resource list -g rg-contoso-sandbox-alex --output table
```

Ask Copilot: *"Explain what I just deployed in five bullets, and tell me roughly
what it costs per day if I leave it running."*

---

## Step 7 — Tear it down (do not skip)

The last move every time. Delete the whole resource group so nothing keeps
running or costing money:

```powershell
az group delete -n rg-contoso-sandbox-alex --yes --no-wait
```

Confirm it's gone:

```powershell
az group exists -n rg-contoso-sandbox-alex
```

> If you deployed into a **facilitator-provided** resource group you can't delete,
> instead ask Copilot for a command to delete just the resources you created, or
> tell your coach so they can clean it up.

---

## Stretch goals (if you finish early)

- *"Convert this Bicep to Terraform and tell me what changed."*
- *"What in this template could cost money or be insecure? Rank the risks."*
- *"Add a second subnet and a rule that blocks all outbound internet from the VM."*
- *"Write a one-command PowerShell script that deploys and, on a flag, destroys."*

## Safety

- **Validate before you deploy** — always run `what-if` first.
- **Least privilege** — Contributor only; never add role assignments here.
- **No secrets** — SSH keys and IPs as parameters, never real subscription IDs,
  keys, or tenant data in prompts.
- **Tear down** when you're done.
- **You own what gets deployed.** Copilot drafts; you approve.
