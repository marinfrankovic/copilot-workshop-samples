# Architecture brief — Contoso "sandbox" environment

Plain-English brief. You (a systems engineer) hand this to GitHub Copilot and
ask it for infrastructure-as-code, the deploy commands, and troubleshooting help
— **without hand-writing the templates**. You review and approve everything
before it runs.

## Context
Contoso needs a small, self-contained **sandbox environment** an engineer can
stand up in minutes, poke at, and tear down the same day. It is non-production
and internal. It must be cheap, private by default, and reproducible from one
command.

## What the environment should include
- A **resource group** in West Europe, tagged `env=sandbox`, `owner=<your alias>`.
- A **virtual network** (`10.20.0.0/16`) with one **subnet** (`snet-app`, `10.20.1.0/24`).
- A **network security group** on the subnet that allows inbound **SSH (22)**
  **only** from a single IP address you pass in as a parameter, and denies the
  rest. No other inbound ports open to the internet.
- A **Linux virtual machine** (Ubuntu 22.04 LTS, a small burstable size such as
  `Standard_B2s`) on that subnet, reachable over SSH via a **public IP**.
- A **storage account** (Standard LRS) for sandbox output — **private, with
  public blob access disabled**.
- Sensible **tags** on every resource.

## Constraints — this is important
- **Low privilege only.** Assume you have **Contributor** on the subscription or
  the resource group. You do **not** have Owner or User Access Administrator, so
  the template must **not** create any **role assignments** (RBAC). If you ever
  want the VM to reach storage via managed identity, treat that as a separate,
  optional step for someone with elevated rights — keep it out of this template.
- **No secrets in code.** Pass the VM admin username and an **SSH public key** as
  parameters; never hard-code a password.
- **Reproducible.** One command to deploy, one command to destroy.
- **Cheap and private.** Smallest sizes that work; nothing public except SSH from
  your own IP.
- **Prefer Bicep** (Azure-native). Terraform is an acceptable alternative if you
  ask for it.

## What you want from Copilot (the loop)
1. Turn this brief into a short **plan**: the resources, their names, and how they
   connect — before any code.
2. Generate the **Bicep** (`main.bicep` plus parameters) implementing it, with
   **no role assignments**.
3. Give the exact **az commands** to preview (`what-if`), deploy, and later
   destroy the whole thing.
4. Refine: lock the NSG down to your IP only, disable public blob access, add tags.
5. Troubleshoot: when a deploy fails, paste the error and ask for the **smallest
   fix** (see `sample-error.txt`).
