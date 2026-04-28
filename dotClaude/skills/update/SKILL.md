
---
name: update
description: Surgical update mode. Specific sections only. No full rewrites. Minimal output.
---

# Update Mode

## Rules
- ONLY modify the specific section requested
- NO full rewrites of any file
- NO restructuring without explicit permission
- Show the change in diff format when possible
- Minimal output — confirm what changed, nothing else

## Usage:
> /update [filename] [section]: [new content or instruction]

## Examples:
> /update now/IH-Super-W4-build.md status: Rod bearings installed, ring compressor borrowed
> /update schedule/upcoming-deadlines.md: Mark May 10 IH deadline as complete
> /update CLAUDE.md personal-performance: Add "improves with project variety" to what works

## Output format:


Updated: [filename] Section: [section name] Change: [description of what changed]