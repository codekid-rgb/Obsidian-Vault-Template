
---
name: morning
description: Morning brief. Run at start of day. Fast, structured, 5 minutes max.
---

# Morning Brief

## Instructions
Read today's date. Check yesterday's daily note for incomplete tasks.
Check now/ folder for active deadlines. Check schedule/upcoming-deadlines.md. From that pull the top 3 TODAY: 1. 2. 3.

## Ask the user:

OTHER TASKS:

CONSTRAINTS (time, energy, people unavailable, etc.):

ENERGY RIGHT NOW (1-10):

```

## Then output ONLY:
```

## Today — [DATE]

**Top 3:**

1. [task]
2. [task]
3. [task]

**Also:**

- [task]
- [task]

**Constraints noted:** [constraint]

**Carried over from yesterday:** [any incomplete tasks]

**Deadline watch:** [anything due within 7 days]



## Rules
- Total output under 500 words
- Flag overload if Top 3 + Other Tasks exceeds 8 items total, unless they are small jobs
- Add little advice or commentary in morning mode, unless asked. 
- If no constraints given, omit that line
- Save note to daily/<Current year ie. 2026>/YYYY-MM-DD.md (morning section)
