---
name: finance
description: Update Finance files from bank statements and cash log. Run when new statements are available or to log cash transactions.
---

# Finance Update

## Trigger
> /finance

---

## Step 1 — Load current state

Read these files:
- Finance/overview.md
- Finance/debts.md
- Finance/cash-log.md

Note the "Last updated" date in overview.md — this is your cutoff for new transactions.

---

## Step 2 — Check for new statements

List all files in `Finance/statements/` excluding anything in `Finance/statements/archive/`.

If no new files: skip to Step 4.

If new files found: tell the user what you found before parsing.

---

## Step 3 — Parse statements

**Bank:** [YOUR_BANK_NAME] — update this line in the skill file to match your bank
Typical CSV export columns: Date, Description, Withdrawals, Deposits, Balance
Date format likely: YYYY-MM-DD or MM/DD/YYYY

For each new statement file:

**If CSV:**
Read the file. If the first row looks like headers, use them. If not, show the user the first 3 rows and ask how to interpret them before continuing.

Extract:
- Account type (chequing or savings — usually in filename or header)
- Closing balance (last Balance value in file)
- All transactions dated after the "Last updated" date from overview.md

Show the user a summary table:
```
| Date | Description | In | Out |
|------|-------------|-----|-----|
| ...  | ...         | ... | ... |
```
Ask: "Anything here look wrong or need a note?"

**If PDF:**
Read and extract the same fields as best you can. If parsing is ambiguous, show the raw text and ask the user to confirm the closing balance manually.

After user confirms: move processed files to `Finance/statements/archive/` (create the folder if it doesn't exist).

---

## Step 4 — Cash transactions

Ask: "Any cash in or out since [last updated date]?"

If yes: collect for each transaction:
- Date
- What it was for
- Amount and direction (in/out)

If no: skip.

---

## Step 5 — Debt check

Ask: "Any debt updates? Any loans paid back, expected income received, or new debts to log?"

If yes: update debts.md surgically — only the rows that changed.
If no: skip.

---

## Step 6 — Update files

**overview.md** — update only:
- Account balances (to match latest statement closing balances)
- Cash estimate (if cash transactions changed it)
- "Last updated" date → today

**cash-log.md** — append only:
```
| YYYY-MM-DD | [description] | [in] | [out] | [new running balance] |
```

**debts.md** — surgical edits only:
- Update amounts if prices confirmed
- Update status column if something was paid

Never rewrite full files. Never delete existing rows.

---

## Step 7 — Output summary

End with a brief block:

```
Finance updated — [DATE]
Chequing:  $X
Savings:   $X
Cash:      ~$X
─────────────────
Total liquid: $X

New statement transactions: X
Cash transactions logged: X
Debts updated: [yes / no]
```

If total liquid dropped significantly since last update, note it plainly.
If a debt was fully cleared, note it with a checkmark.

---

## Rules
- Append only — never delete transaction history
- Surgical edits only — never rewrite full files
- Always confirm statement parse before archiving
- If CSV columns don't match expected format, show user first 3 rows and ask
- Flag any transaction over $200 that isn't a known expected item
