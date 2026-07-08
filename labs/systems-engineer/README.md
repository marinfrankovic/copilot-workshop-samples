# Systems Engineer track — describe an environment in plain English

**Goal:** describe the environment you need in plain English and let GitHub
Copilot produce the infrastructure-as-code, the deploy/preview/destroy commands,
and plain-English fixes when a deployment fails. You **deploy it to Azure for
real**, then tear it down. You stay in control; Copilot drafts.

> **Start here:** open [`LAB.md`](LAB.md) and follow it top to bottom (~50 min).

## Files
- [`LAB.md`](LAB.md) — the step-by-step, self-guided lab.
- [`architecture-brief.md`](architecture-brief.md) — the plain-English brief (your input).
- [`main.bicep`](main.bicep) — an almost-empty starter for Copilot to fill.
- [`sample-error.txt`](sample-error.txt) — realistic deployment errors to paste and fix.

## What you need
- VS Code + GitHub Copilot (Chat, Agent mode).
- Azure CLI (`az`) installed.
- **Contributor** on a subscription or resource group. **No Owner needed** — this
  lab never creates role assignments.

## The loop
1. **Plan** — Copilot reads the brief and lists resources before writing code.
2. **Generate** — Copilot fills `main.bicep` (network, NSG, VM, storage), no RBAC.
3. **Run** — preview with `what-if`, then deploy.
4. **Refine** — lock the NSG to your IP, keep storage private, add tags.
5. **Sanity-check** — paste `sample-error.txt`, fix the smallest thing, then
   **tear it all down**.

## Safety
- Validate before you deploy (`what-if`); know what gets created and what it costs.
- Least-privilege: Contributor only, no role assignments in this template.
- Never paste real subscription IDs, secrets, or tenant data into prompts.
- Delete the resource group when you finish. You own what gets deployed.
