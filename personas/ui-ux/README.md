# UI/UX track — Design in plain English

**Goal:** describe a UI in plain English and let Copilot produce a component
spec, design tokens, and a working prototype you can see in a browser. This is
the same muscle you use to drive Figma's AI features, Copilot, or a code preview
— design intent in, artefacts out.

## Files
- `design-brief.md` — the plain-English brief (your input).
- `design-tokens.json` — starter colours/spacing/type to reuse.
- `prototype-starter.html` — almost-empty file for Copilot to fill.

## Short demo (the loop)
1. **Describe:** "Read `design-brief.md`. Write a short component spec: content, states, responsive behaviour."
2. **Tokens:** "Extend `design-tokens.json` with a dark-mode set and hover/focus states. Keep it valid JSON."
3. **Generate:** "Using the brief and tokens, build the card in `prototype-starter.html` as plain HTML + CSS. Map tokens to CSS variables."
4. **Refine:** "Add a dark-mode toggle. Improve the up/down trend contrast for accessibility (WCAG AA)."
5. **Sanity-check:** open the HTML in a browser; check it on a narrow window (phone width).

## Prompt starters
- "Suggest 3 layout options for this card and the trade-offs of each."
- "Generate accessible alt text and ARIA labels for the trend indicator."
- "Turn these tokens into a CSS variables block and a Figma-style token table."
