---
description: Tighten prose for clarity using Orwell's six rules (editor mode).
argument-hint: "[file path or pasted text]"
---

Invoke the `orwell-prose` skill in **editor mode** and apply it to the target below.

Target: $ARGUMENTS

If `$ARGUMENTS` is a file path, read it and edit it in place (after the Rule-6 pass), then report
the changes. If it is pasted text, return the tightened version plus a short before→after report.
If no target is given, ask what to proofread.

Hold the disciplines: cut before substituting, keep correct passives and genuine terms of art,
never invent specifics to fill a gap (mark `[needs detail]` instead). Do **not** "improve"
evasive/marketing/political text — if that's what this is, stop and run `/unspin` instead.
