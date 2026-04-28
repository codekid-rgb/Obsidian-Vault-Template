# Obsidian Vault — Claude Code Template

A personal knowledge management system that pairs [Obsidian](https://obsidian.md) with [Claude Code](https://claude.ai/code) skills for structured daily life management.

Morning briefs, evening debriefs, weekly reviews, project tracking, vehicle assessments, and finance logging — all driven by simple slash commands in your terminal.

---

## Quick Start

```bash
# 1. Clone the template
git clone <this-repo> my-vault
cd my-vault

# 2. Open in Obsidian
# File → Open Vault → select the my-vault folder

# 3. Start Claude Code in the vault directory
claude

# 4. Run the setup wizard
/setup
```

The `/setup` wizard will interview you and configure `CLAUDE.md`, your schedule files, and your first active project. It also works on an **existing Obsidian vault** — it detects what's already there and only fills in what's missing.

---

## Daily Workflow

| Time | Command | What it does |
|------|---------|--------------|
| Morning | `/morning` | Reviews incomplete tasks, upcoming deadlines, asks about your energy and focus |
| Throughout day | Chat naturally | Log tasks, make notes, update projects |
| Evening | `/evening` | Debrief: what got done, what didn't, gratitude, friction, tomorrow's top 3 |
| Sunday | `/weekly` | Pattern analysis across the week |

---

## Skills

| Command | Description |
|---------|-------------|
| `/setup` | Initialize vault or add missing structure to an existing vault |
| `/daily` | Create today's daily note from template |
| `/morning` | Morning brief — tasks, schedule, energy check-in |
| `/evening` | Evening debrief — review, reflection, gratitude |
| `/weekly` | Weekly review — pattern detection across daily notes |
| `/reflect` | Reflection mode — observations, patterns, risks, suggestions |
| `/vehicle` | Create or update a vehicle assessment note |
| `/finance` | Update finance files from bank statements + cash log |
| `/update` | Surgical update mode — edit a specific section of a specific file |

---

## Vault Structure

```
my-vault/
├── Daily/YYYY/          # Daily notes (YYYY-MM-DD.md)
├── Now/                 # Active projects with deadlines
├── Schedule/            # Recurring events + upcoming deadlines
├── Templates/           # Note templates
├── People/              # Mentors, friends, family
├── Vehicles/            # Vehicle assessments
├── Finance/             # Budget, statements, cash log
├── Farm/                # Farm vision and operations
├── Shop/                # Business vision and structure
├── School/              # Education decisions
├── Faith/               # Values and reflection
├── Habits/              # Routine tracking
├── Projects/            # Active builds
├── Ideas/               # Future projects
├── dotClaude/skills/    # Claude skill definitions
└── CLAUDE.md            # System configuration (edit this)
```

Not all folders are relevant to everyone. During `/setup` you can choose which ones to keep.

---

## How It Works

Claude Code reads `CLAUDE.md` at the start of each session to understand who you are, what your goals are, and how to behave. The skills in `dotClaude/skills/` define specific workflows that Claude executes when you run a slash command.

**To update your personal info:** edit `CLAUDE.md` directly, or run `/setup` again.

**To add a new skill:** create a folder in `dotClaude/skills/` with a `SKILL.md` file. Add a matching shortcut in `.claude/commands/`.

---

## Nix Dev Environment (optional)

If you use Nix:

```bash
nix develop
```

This drops you into a shell with `claude` and command aliases (`/daily`, `/morning`, etc.) available. See `flake.nix` for details.

> **macOS note:** Obsidian isn't in nixpkgs for macOS. Install it separately from [obsidian.md](https://obsidian.md).

---

## Customization

Everything is driven by `CLAUDE.md`. After running `/setup`:
- Edit `## Who I Am` to update your personal context
- Edit `## Key People` as relationships change
- Edit `## Habits and Accountability` as goals evolve
- Edit `## Vault Structure` if you add custom folders

Skills can be edited directly in `dotClaude/skills/*/SKILL.md`. The `/finance` skill has a bank name placeholder — update it to match your bank.
