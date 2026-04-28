---
name: daily
description: Create today's daily note from template if it doesn't exist.
---

# Daily Note Creation

## Check first
Does Daily/2026/YYYY-MM-DD.md exist for today?
If yes: open it and report what's already there.
If no: create it using the content of Templates/Daily Note.md, replacing {{title}} with today's date in YYYY-MM-DD format.

## Output
One line: "Created Daily/2026/[date].md — run /morning to begin"
