# Design brief — Contoso "Welcome back" dashboard card

Plain-English brief. A UI/UX designer hands this to Copilot and asks for a
component spec, design tokens, and a working HTML/CSS prototype — no hand-coding.

## Context
Contoso has a SaaS analytics product. Returning users land on a dashboard.
We want a friendly **"Welcome back" summary card** at the top of the page.

## Who it's for
Busy account managers who open the app a few times a day and want a 5-second
read of "what changed since last time".

## What the card should show
- A greeting with the user's first name.
- One headline number: revenue this month.
- A small trend indicator vs last month (up / down, with %).
- Three compact stats: new sign-ups, active accounts, open tickets.
- One primary action button: "View full report".

## Tone & style
- Calm, professional, not flashy. Lots of whitespace.
- Rounded corners, soft shadow, single accent colour.
- Must be readable for someone in a hurry. Accessible colour contrast.

## Constraints
- Works on a laptop and a phone (responsive).
- No external libraries — plain HTML and CSS only for the prototype.
- Use the values in `design-tokens.json` for colours, spacing, and type.

## What I want from Copilot (the loop)
1. Turn this brief into a short **component spec** (states, content, behaviour).
2. Propose / extend the **design tokens**.
3. Generate a single-file **HTML + CSS prototype** I can open in a browser.
4. Refine: spacing, dark-mode variant, hover/focus states, accessibility.
