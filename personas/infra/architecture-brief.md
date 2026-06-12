# Infrastructure brief — Contoso "reporting service" environment

Plain-English brief. An infra/platform person hands this to Copilot and asks for
infrastructure-as-code, deployment steps, and troubleshooting help — without
hand-writing the templates.

## Context
Contoso needs somewhere to host a small internal **monthly reporting service**
(a web app + the cleaned sales data behind it). It should be cheap, private, and
easy to tear down. This is non-production / internal.

## What the environment should include
- A **resource group** in West Europe, tagged `env=demo`, `owner=contoso-it`.
- A **storage account** to hold the cleaned CSV / report output (private, no public blob access).
- An **App Service plan + web app** (Linux, smallest tier that works) to host the reporting UI.
- **Application settings** wired so the web app can read from the storage account.
- Diagnostics/logs sent somewhere we can read them.

## Constraints
- Least-privilege: use a **managed identity** for the web app to reach storage — no keys in config.
- Everything must be **reproducible** (one command to deploy, one to destroy).
- Keep it small and inexpensive; this is a demo, not production.
- Prefer **Bicep** (Azure-native). Terraform is an acceptable alternative if asked.

## What I want from Copilot (the loop)
1. Turn this brief into a short **plan**: the resources, names, and how they connect.
2. Generate the **Bicep** (a `main.bicep` plus parameters) implementing it.
3. Give me the exact **az / deploy commands** to validate and deploy, and one to tear it down.
4. Refine: add the managed-identity role assignment, tags, and diagnostic settings.
5. Troubleshoot: when a deploy fails, paste the error and ask for the smallest fix (see `sample-error.txt`).
