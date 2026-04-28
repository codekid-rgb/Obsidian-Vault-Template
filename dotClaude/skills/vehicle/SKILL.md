---
name: vehicle
description: Create or update a vehicle assessment note. Full specs, condition, and honest recommendation.
---

# Vehicle Assessment

## Trigger
> /vehicle [description]
or
> /vehicle update [truck name]: [new information]

## For NEW vehicle — ask for:
- Year, make, model, trim
- Engine and drivetrain
- Transmission
- Body condition (specific spots)
- Mechanical condition
- Known issues
- Ownership and likely price
- Location (yard, field, specific spot)

## Output format:
```markdown
# [Year Make Model] — [Nickname if any]

## Specs
- Engine:
- Transmission:
- Transfer case:
- Front/Rear axle:
- Cab/Box:

## Condition
**Body:** [honest assessment]
**Mechanical:** [honest assessment]
**Interior:** [honest assessment]

## Known Issues
1. [issue]
2. [issue]

## Ownership
[Who owns it, price paid, likely ask price]

## Parts Availability
[Especially what's in great uncle's yard]

## My Assessment
**Status:** [Active consideration / Ideas folder / Eliminated / Acquired]
[2-3 sentences honest summary]
[Pros and cons if status is active consideration]

## Next Steps
- [ ] [action]
```

## For UPDATE — surgical only
Append new information to relevant section with date stamp
Never rewrite existing assessments — add to them