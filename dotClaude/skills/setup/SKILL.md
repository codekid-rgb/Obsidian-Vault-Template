---
name: setup
description: Initialize or update this Obsidian vault for a new user. Interviews the user, reconciles existing vault structure, and writes CLAUDE.md + schedule files. Works for both fresh installs and existing vaults.
---

# Vault Setup Wizard

## Trigger
> /setup

---

## Step 0 — Detect vault state

Before asking anything, scan the current directory:

1. Read `CLAUDE.md` — does the `## Who I Am` section still say `[SETUP REQUIRED`? If not, this is an **existing configured vault**.
2. List all top-level folders in the vault directory.
3. Check if `Schedule/Recurring Events.md` has real content (not just the placeholder template).
4. Check if `Now/` contains any files beyond the example stubs.

**Standard template folders** (for comparison):
`Now`, `People`, `Vehicles`, `Finance`, `Projects`, `Ideas`, `Farm`, `Shop`, `School`, `Faith`, `Habits`, `Schedule`, `Templates`, `Daily`, `dotClaude`

Determine:
- `existing_folders` — folders already present
- `missing_folders` — standard template folders not present
- `extra_folders` — folders present that aren't in the standard set (user's custom structure)
- `is_fresh` — true if CLAUDE.md still has `[SETUP REQUIRED` in Who I Am

Report findings before proceeding. Example:
> "I can see you already have Now/, Finance/, Daily/, Schedule/. Missing from the standard set: Vehicles/, Farm/, Shop/, People/. I also see a custom folder: Freelance/. I'll preserve everything that's there and only fill in what's missing."

---

## Step 1 — Welcome + mode announcement

**If fresh vault:**
> "Welcome! This vault connects Obsidian with Claude Code to give you a structured daily system — morning briefs, evening debriefs, weekly reviews, project tracking, and more. Let me ask you a few questions to set it up for you. This takes about 5 minutes."

**If existing vault:**
> "Looks like you've already got some things set up. I'll fill in the gaps and adapt to your existing structure without overwriting what's there. Just answer a few questions about what's missing."

---

## Step 2 — Interview

Ask these conversationally — one or two at a time, not as a form dump. Wait for answers before continuing.

**Block A — Identity**
1. "What's your name? (Used throughout the vault)"
2. "How would you describe your situation in a sentence or two? (Student, professional, farmer, small business owner, etc.)"
3. "Where are you based, and what timezone? (Optional — helps with scheduling)"

**Block B — Values / Faith**
4. "Do you want a faith or values section in your daily reflections? The default template includes prompts like 'Where did I see God today?' — keep, replace with something else, or remove?"

**Block C — Life areas**
5. Look at `missing_folders`. For each one, ask if the user wants it:
   > "I notice you don't have a [Farm/Vehicles/Shop] folder. Do you want one? (yes/no)"
   
   For `extra_folders` already present: note them — they'll be added to CLAUDE.md's Vault Structure section.

**Block D — Key people**
6. "Who are 2-3 people important to your work or goals? (Mentor, close friend, accountability partner, etc.) Give me a name and one-line description for each."

**Block E — Schedule**
7. **If Schedule/Recurring Events.md is already populated:** "Your schedule looks set up. Want to add anything or leave it as-is?"
   **If not:** "What are your top 3-5 recurring weekly commitments? (e.g. Monday 9am team meeting, Thursday 7pm youth group)"

**Block F — Active projects**
8. **If Now/ already has real files:** "I can see you have active projects in Now/. Want to add a new one, or skip?"
   **If not:** "What's one active project or goal you're working on right now? Give me a name, deadline if any, and what 'done' looks like."

**Block G — Habits**
9. "Any habits you're trying to build or track? (Optional — e.g. sleep by 10:30pm, screen-free mornings)"

**Block H — Finance**
10. "Do you want to use the finance tracking skill? It logs bank statements and cash transactions. Yes or no — you can always add it later."

---

## Step 3 — Folder reconciliation

After the interview:

1. For each folder the user approved in Block C: create it with a `.gitkeep` file.
2. For `extra_folders` the user already has: do nothing — just note them.
3. Confirm the final folder list with the user before writing any files:
   > "Here's what I'll create: [list]. Here's what I'll leave as-is: [list]. Good to go?"

---

## Step 4 — Write files (confirm before each)

### 4a — CLAUDE.md

Tell the user: "I'm going to write your personal info into CLAUDE.md. Here's what I'll put in each section — let me know if anything needs changing before I write it."

Show a preview of the sections to be filled:
- Who I Am: [assembled from Block A answers]
- Goals / Vision: [from Block B context + life areas]
- Key People: [from Block D]
- Faith / Values: [from Block B — either populated, renamed, or marked for removal]
- Habits: [from Block G]
- Financial Situation: [brief note if finance tracking enabled, or "not tracked" if no]
- Vault Structure: [updated with any extra folders]

**For fresh vaults:** Replace all `[SETUP REQUIRED]` placeholders with real content.
**For existing vaults:** Only update sections that still contain `[SETUP REQUIRED]` placeholders. Do NOT touch sections that already have real content unless the user says to.

After user confirms: write CLAUDE.md. Show what changed.

### 4b — Schedule/Recurring Events.md

**If user provided recurring commitments:** Replace the placeholder content with their events.
**If already populated:** Offer to append new items only.

Confirm before writing.

### 4c — First Now/ project file

**If Now/ has no real files:** Create `Now/[ProjectName] — Active Log.md` from the template, filled with the user's answers from Block F.
**If Now/ already has files:** Skip unless user asked to add one.

Confirm before writing.

### 4d — Daily/ folder

Ensure `Daily/[current year]/` exists. Create it with a `.gitkeep` if not present.

---

## Step 5 — Confirm setup complete

Output:

```
Setup complete.

Files written:
- CLAUDE.md (updated sections: [list])
- Schedule/Recurring Events.md
- Now/[project name].md (if created)

Folders created: [list or "none — all existed"]

Next steps:
1. Run /daily to create today's note
2. Run /morning for your first morning brief
3. Edit CLAUDE.md any time to update your info
```

If anything was skipped, mention it briefly: "Finance tracking not set up — run /finance when you're ready."

---

## Rules
- Never overwrite sections of CLAUDE.md that already have real (non-placeholder) content
- Always confirm the full write plan before touching any file
- Preserve all existing vault content exactly
- If the user says to skip something, skip it — don't ask again
- Keep the conversation natural — don't dump all questions at once
