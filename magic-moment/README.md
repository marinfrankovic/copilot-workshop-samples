# Magic moment — make sense of a mystery log in 60 seconds

The opener. One messy log file → an instant plain-English diagnosis and a clean,
structured table. It speaks to **both** audiences without being either later demo:
infra people recognise the incident (a failed deploy, a permissions error, a
circuit breaker); data people recognise the real skill (parsing inconsistent text
into structure). It is deliberately NOT the Bicep demo and NOT the CSV→SQL demo.

## File
- `server.log` — a short, realistic, deliberately messy log: mixed timestamp
  formats, two log styles (plain + key=value), an auth failure, retries, a circuit
  breaker, a fix, and recovery. Fictitious Contoso.

## The demo (the loop, ~5 minutes)
1. **Describe:** "Look at server.log. In plain English, what is this service doing and what went wrong? Assume I'm not reading every line."
2. **Diagnose:** "What is the most likely root cause, and what fixed it? Quote the lines that prove it."
3. **Structure:** "Turn the log into a clean table with columns timestamp, level, component, message — normalise the two timestamp formats."
4. **Quantify:** "Count events by level and show the error rate per minute so I can see the spike and the recovery."
5. **Sanity-check:** "How many ERROR lines did you find, and what's the first and last timestamp? I want to trust this."

## Why it lands
- Under a minute from a wall of text to "ah, it was a missing role assignment."
- Shows comprehension, structuring, and quantifying — the moves both tracks build on next.
- No setup: it's just reading a file, so it works even if nothing else is installed.
