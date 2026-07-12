# Magic moment — make sense of a mystery log in 60 seconds

The opener the **facilitator** runs live during the 10-minute intro. One messy
log file → an instant plain-English diagnosis and a clean, structured table. It
speaks to **both** audiences without being either lab: systems engineers
recognise the incident (a failed deploy, a permissions error, a circuit
breaker); data engineers recognise the real skill (parsing inconsistent text
into structure). It is deliberately NOT the infra lab and NOT the data lab.

## File
- `server.log` — a short, realistic, deliberately messy log: mixed timestamp
  formats, two log styles (plain + key=value), an auth failure, retries, a
  circuit breaker, a fix, and recovery. Fictitious Contoso.

## How to run it
Run it wherever you're set up (see [`SETUP.md`](../SETUP.md)):
- **Codespace:** in **Copilot Chat (Agent mode)**.
- **GitHub Copilot app:** an **Interactive** session on the project (or a **Quick
  chat**).

Copilot can already see `server.log`, so just type the prompts below into the chat
one at a time — no commands to copy or run.

## The demo (the loop, ~2 minutes)
1. **Describe:** "Look at server.log. In plain English, what is this service doing and what went wrong? Assume I'm not reading every line."
2. **Diagnose:** "What is the most likely root cause, and what fixed it? Quote the lines that prove it."
3. **Structure:** "Turn the log into a clean table with columns timestamp, level, component, message — normalise the two timestamp formats."
4. **Quantify:** "Count events by level and show the error rate per minute so I can see the spike and the recovery."
5. **Sanity-check:** "How many ERROR lines did you find, and what's the first and last timestamp? I want to trust this."

## Why it lands
- Under a minute from a wall of text to "ah, it was a missing role assignment."
- Shows comprehension, structuring, and quantifying — the moves both labs build on.
- No setup: it just reads a file, so it works even if nothing else is installed.
- It sets up the loop the attendees will run themselves for the next 50 minutes.
