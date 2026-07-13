# Systems Engineer track — describe an environment in plain English

**Goal:** describe the environment you need in plain English and let GitHub
Copilot produce the infrastructure-as-code, the deploy/preview/destroy commands,
and plain-English fixes when a deployment fails. You **deploy it to Azure for
real**, then tear it down. You stay in control; Copilot drafts.

> **Start here:** open [`LAB.md`](LAB.md) and follow it top to bottom (~45 min).
>
> **Never used these tools before?** Do [`SETUP.md`](../../SETUP.md) in the top
> folder first (start Codespaces, sign into Copilot and Azure), then open `LAB.md`.

## Files
- [`LAB.md`](LAB.md) — the step-by-step, self-guided lab.
- [`architecture-brief.md`](architecture-brief.md) — the plain-English brief (your input).
- [`main.bicep`](main.bicep) — an almost-empty starter for Copilot to fill.
- [`sample-error.txt`](sample-error.txt) — realistic deployment errors to paste and fix.

## What you need
- **GitHub Codespaces** following [`CODESPACES.md`](../../CODESPACES.md), or the
  **GitHub Copilot app** following [`SETUP.md`](../../SETUP.md).
- Azure CLI (`az`) and Bicep: included in Codespaces; install Azure CLI locally
  for the Copilot app path.
- An Azure subscription your facilitator **provides and invites you to**, with
  **Contributor** access and the **subscription ID** they gave you. **No Owner
  needed** — this lab never creates role assignments.

## The loop
You do all of this by **talking to Copilot** — it writes and runs things, you
approve each step.
1. **Plan** — ask Copilot to read the brief and list the resources.
2. **Generate** — ask it to fill `main.bicep` (network, VM, storage), no role assignments.
3. **Run** — ask it to preview with `what-if`, then deploy to a uniquely-named group.
4. **Refine** — ask it to lock the firewall to your IP, keep storage private.
5. **Sanity-check** — paste an error from `sample-error.txt`, let it fix the smallest
   thing, then ask it to **tear everything down**.

## Safety
- Validate before you deploy (`what-if`); know what gets created and what it costs.
- Least-privilege: Contributor only, no role assignments in this template.
- Never paste real subscription IDs, secrets, or tenant data into prompts.
- Delete the resource group when you finish. You own what gets deployed.
