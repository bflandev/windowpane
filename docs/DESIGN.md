# Windowpane — design notes

Why the plugin is shaped the way it is. Useful if you want to extend it or understand the
trade-offs.

## The essay contains two skills, not one

"Politics and the English Language" has a **prescriptive** half (the six rules — improve writing)
and a **diagnostic** half (the four-fault taxonomy + the political critique — expose writing that
avoids meaning). Most adaptations build only the first. Windowpane builds both, because the second
is closer to Orwell's actual thesis — that vague language is *insincerity*, "designed to make lies
sound truthful." They are one skill (`orwell-prose`) with two modes: **editor** and **detector**.

## Rule 6 is the whole game

A naïve implementation becomes a "passive voice = bad" linter that mangles lab reports and
strips deliberate voice. Orwell's sixth rule — *break any of these rather than say anything
outright barbarous* — is therefore enforced as a mandatory pass, not a footnote:

- The editor keeps correct passives (actor unknown/irrelevant), genuine terms of art, and long
  words with no true short synonym — and **says so**.
- Every edit must read *better*, not merely shorter/more-Saxon/more-active, or it is reverted.

The validation set deliberately includes a case the tool must **refuse** to "fix" (a scientific
methods passive).

## The §9 contradiction check

Detector mode's evasion taxonomy grew a ninth category during development:
**internal contradiction / fails-its-own-thesis** — the text violates the standard it preaches
(a memo praising transparency while deleting every actor; a mission statement selling clarity in
unpicture-able prose). It earns its own category because it needs **no inference about intent** —
you hold two parts of the text against each other and the gap is self-evident. It is often the
single most damning finding. Equally important: the tool is taught **when not to use it** — forcing
§9 onto a text that declares no standard is itself a misfire.

## The fairness guardrail

Detector mode is built to **separate earnest abstraction from bad-faith concealment**. It credits
concrete, working passages, flags where vagueness may be honest uncertainty rather than evasion,
and stays anchored to what the *words* do rather than imputing motive. This keeps it from becoming
a cynicism machine that nukes everything.

## Two agents: the review/execute split

Mirroring a reviewer/coach pattern, the skill is wrapped by two agents:

- **`prose-editor`** — read-write; applies clarity edits; *editor mode only*.
- **`prose-critic`** — read-only; clarity notes + detector teardown; never edits.

The load-bearing boundary: **`prose-editor` is forbidden from laundering evasive text.** Pointed at
a press release with "make it read better," it stops and defers to `prose-critic`, because a tighter
lie is a better lie. That is why two agents beat one — the capability to edit and the duty to refuse
to edit live in different places.

## Calibration & validation

- **Calibration target:** Orwell's own parody — a verse of Ecclesiastes rewritten in modern bad
  English. Editor mode must recover the concrete original; detector mode must name every fault.
  The subtle trap (baked into the examples): a *clearer-but-still-abstract* rewrite still fails,
  because the essay's real lesson is that abstraction strips the seeing.
- **Worked examples** (`skills/orwell-prose/examples/before-after.md`): Ecclesiastes both
  directions, an editor-mode corporate edit, a detector-mode layoff memo, the legitimate-passive
  guard, the §9 contradiction case, a euphemism-dominant mission-statement case (with
  when-*not*-to-use-§9), and agent smoke-test results (Rule-6 saves, the `[needs detail]` bracket
  rule, and the anti-laundering handoff).
- **Smoke tested** end to end: editor edits a real file (kept correct passives, bracketed a
  withheld timeline rather than inventing one); critic ran a full detector teardown with §9 firing
  correctly and the fairness note crediting the one concrete figure; and the editor's
  anti-laundering guard fired on "make it read better."

## Extending it

- New evasion patterns → add to `references/detector-mode.md` (and surface in `SKILL.md` if it
  should be visible without opening the reference).
- New plain-word swaps / operator phrases → `references/false-limbs.md`.
- New dead idioms → `references/dying-metaphors.md`.
- Keep the examples file as the regression suite: add a worked case for any new behavior, and keep
  at least one case the tool must *decline* to act on.
