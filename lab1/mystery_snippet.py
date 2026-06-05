# Lab 1 — Exercise A: "Explain this to me"
# You did NOT write this. Your job is to ask Copilot Chat what it does,
# then ask it to add comments and a friendlier name.

def f(rows):
    seen = {}
    for r in rows:
        k = r.get("email", "").strip().lower()
        if not k:
            continue
        if k not in seen:
            seen[k] = r
        else:
            if r.get("updated", "") > seen[k].get("updated", ""):
                seen[k] = r
    return list(seen.values())


sample = [
    {"email": "MEGAN@contoso.com ", "name": "Megan",   "updated": "2026-01-10"},
    {"email": "megan@contoso.com",  "name": "Megan B.", "updated": "2026-03-02"},
    {"email": "alex@contoso.com",   "name": "Alex",     "updated": "2026-02-15"},
    {"email": "",                   "name": "No Email", "updated": "2026-04-01"},
]

if __name__ == "__main__":
    for row in f(sample):
        print(row)
