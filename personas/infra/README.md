# Infra track — describe infrastructure in plain English

**Goal:** describe the environment you need in plain English and let Copilot
produce infrastructure-as-code, the deploy/validate/destroy commands, and
plain-English fixes when a deployment fails. You stay in control; Copilot drafts.

## Files
- `architecture-brief.md` — the plain-English brief (your input).
- `main.bicep` — almost-empty starter for Copilot to fill.
- `sample-error.txt` — realistic deployment errors to paste and fix.

## Short demo (the loop)
1. **Plan:** "Read `architecture-brief.md`. List the resources, names, and how they connect, before writing any code."
2. **Generate:** "Build `main.bicep` from the brief: storage, Linux App Service plan + web app, managed identity with least-privilege access to storage, tags, diagnostics. Add parameters and explain each block."
3. **Deploy:** "Give me the exact az commands to validate, deploy, and later tear this down."
4. **Refine:** "Make blob access private and wire the web app to storage via managed identity, not keys."
5. **Troubleshoot:** paste `sample-error.txt` → "Explain these errors in plain English and give the smallest fix for each."

## Prompt starters
- "Convert this Bicep to Terraform and tell me what changed."
- "What in this template could cost money or be insecure? Rank the risks."
- "Generate a one-command destroy script so I leave nothing running."
- "Explain this template to a non-engineer in 5 bullets."

## Safety
- Validate before you deploy; always know what gets created and what it costs.
- Use least-privilege (managed identity, no keys/secrets in config).
- Never paste real subscription IDs, secrets, or tenant data into prompts.
- You own what gets deployed. Copilot is a helper, not the approver.
