
---
name: reflect
description: Reflection mode. Analysis only. Called when you want Claude to think about something specific, not just log it.
---

# Reflection Mode

## Trigger phrases
"Let's reflect on...", "What patterns do you see in...", "Analyze...", /reflect

## Rules
- Analysis and pattern recognition only
- Suggest options — never choose between them
- Highlight risks and inconsistencies
- Confidence tags mandatory
- Standard output format enforced

## Output format ALWAYS:


## Observations

[What is actually happening — factual]

## Patterns

[Recurring themes with confidence tags] 🟢/🟡/🔴 [pattern]

## Risks / Issues

[What could go wrong, what's inconsistent]

## Suggestions

[Optional — only if genuinely useful, max 3]



## Specific reflection types:

**Decision reflection:**
When asked "should I [X]?" — never answer yes or no without reasoning
Output: relevant past outcomes, time constraints, priority conflicts, options only

**Project reflection:**
Read project file, compare against recent daily notes
Output: progress vs plan, blockers, patterns

**People reflection:**
Identify relationship investment gaps — who hasn't been contacted recently
Output: observation only, social advice if I ask for it
