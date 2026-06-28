---
name: orwell-prose
description: >
  Edit prose for clarity and detect evasive language, using George Orwell's "Politics and the
  English Language" (1946) as the working discipline — his six rules and his four-part taxonomy
  of bad writing (dying metaphors, operators / verbal false limbs, pretentious diction,
  meaningless words). Two modes. EDITOR MODE (default): tighten, declutter, and de-jargon
  writing — cut dead metaphors and padding, swap long Latinate words for short Anglo-Saxon
  ones, prefer the active voice, and report before/after with the reason. DETECTOR MODE:
  expose euphemism, evasion, abstraction, and bad-faith vagueness in political, corporate,
  marketing, PR, or bureaucratic text — name what each phrase is concealing. Use this skill
  whenever the user wants to make writing clearer, tighter, plainer, or less pretentious;
  asks for a prose/style/copy edit, "plain English", "make this less corporate / less
  academic / less wordy", "cut the jargon", "tighten this", "why is this writing bad"; OR
  wants to analyze spin, euphemism, weasel words, doublespeak, corporate-speak, mission
  statements, press releases, or political language for what it hides. Triggers on "Orwell",
  "politics and the english language", "six rules", "passive voice", "dying metaphor",
  "weasel words", "euphemism", "plain language", "jargon", "purple prose", "wordy",
  "pretentious", "doublespeak", "spin", "say what you mean". NOT a grammar/spell checker and
  NOT for poetry, dialogue, or legal text where the "rules" rightly break (see Rule 6).
---

# Orwell Prose — clear writing & evasion detection

This skill turns Orwell's essay into a working editorial discipline. The essay's thesis is that
**vague, stale, pretentious language is not just ugly — it is a symptom and a cause of muddled or
dishonest thinking.** "The great enemy of clear language is insincerity." So this skill does two
jobs that are really one job seen from two sides:

- **Editor mode** (default) — make a piece of writing say what it means, plainly. You are
  helping a sincere writer be clearer.
- **Detector mode** — find where a piece of writing is *avoiding* meaning. You are reading a
  political/corporate text the way Orwell read government pamphlets: asking what the fog is for.

Pick the mode from intent. "Tighten this" / "make it clearer" → editor. "What is this hiding?" /
"analyze the spin" → detector. If a user pastes a press release and asks you to "improve" it,
ask which they want — to make it *clearer* or to *expose* it.

## The non-negotiable rule: Rule 6 governs the other five

Orwell's sixth rule — **"Break any of these rules sooner than say anything outright barbarous"** —
is the whole skill. The other five are heuristics, not laws. A mechanical pass that strips every
passive and every long word produces writing as dead as what it replaced. **Never apply rules
1–5 without running the Rule-6 check on each edit:** is the rewrite actually better, or just
shorter / more Saxon / more active? If the "fix" is now stilted, ambiguous, or wrong, keep the
original and say why.

The passive is *correct* when the actor is unknown, irrelevant, or deliberately de-emphasized
("the samples were refrigerated overnight"). Jargon is *correct* among specialists who share it.
Long words are *correct* when no short word carries the same meaning. Do not "fix" these.

**Never apply this skill to** poetry, song lyrics, intentional dialect/voice, dialogue, quoted
speech, or legal/contractual text whose precision depends on its boilerplate. Flag, don't edit.

## Orwell's six rules (the editor's checklist)

1. **Never use a metaphor, simile, or other figure of speech you are used to seeing in print.**
2. **Never use a long word where a short one will do.**
3. **If it is possible to cut a word out, always cut it out.**
4. **Never use the passive where you can use the active.**
5. **Never use a foreign phrase, a scientific word, or a jargon word if you can think of an
   everyday English equivalent.**
6. **Break any of these rules sooner than say anything outright barbarous.**

And the four questions Orwell says a scrupulous writer asks of every sentence — use these as the
editor's diagnostic loop:

> *What am I trying to say? What words will express it? What image or idiom will make it clearer?
> Is this image fresh enough to have an effect?* — and then — *Could I put it more shortly? Have
> I said anything that is avoidably ugly?*

## The four faults (the diagnostic taxonomy)

Every flag you raise should be tagged with one of these four categories. Full catalogs with
Orwell's examples and modern equivalents are in the reference files.

| Fault | What it is | Read |
|-------|-----------|------|
| **Dying metaphors** | Worn figures used with no image in mind ("toe the line", "ride roughshod over", "the elephant in the room") | `references/dying-metaphors.md` |
| **Operators / verbal false limbs** | A phrase doing a single verb's job ("render inoperative", "give rise to", "make contact with"), padding, "-ize"/"not un-" formations | `references/false-limbs.md` |
| **Pretentious diction** | Long Latin/Greek words dressing up plain statements, war-dignifying vocabulary, needless foreign phrases ("utilize", "constitute", "deus ex machina") | `references/false-limbs.md` |
| **Meaningless words** | Abstractions with no agreed meaning, used to impress or deceive ("democracy", "values", "synergy", "world-class") | `references/fault-taxonomy.md` |

## Workflow

**Editor mode:**
1. **Classify & guard.** Identify the text type. If it's poetry/dialogue/legal/intentional-voice,
   stop and say so — offer notes, not edits.
2. **Diagnose.** Walk the text. Quote each instance, tag its fault category. Don't fix yet.
3. **Rewrite.** Produce the shortest *honest* version of each flagged passage. Cut before you
   substitute (Rule 3 first).
4. **Rule-6 pass.** For each edit, confirm it's genuinely better, not just shorter. Revert any
   that now read worse, and note why you left them.
5. **Report.** Deliver before/after, the fault tag per change, and a one-line "why it mattered"
   (flab vs. concealment vs. staleness). Give a clean final version at the end.

**Detector mode** → see `references/detector-mode.md`. Briefly: classify each evasive move
(euphemism, abstraction, agentless passive that hides the actor, dead metaphor as thought-saver,
inflated diction, meaningless honorific, **internal contradiction / fails-its-own-thesis**), quote
it, name **what concrete reality or actor it conceals**, and give the plain-English translation.
Always run the contradiction check — does the text obey its own stated standard? That gap is often
the headline finding. Don't rewrite the text to be "better" — that would launder it; translate it
to expose it.

## The test case that proves the skill works

Orwell's parody — a verse of Ecclesiastes rewritten in modern bad English — is the calibration
target. The editor mode must be able to turn the bad version back into the good one; the detector
mode must be able to name every fault in the bad version. Both directions live in
`examples/before-after.md`. If your editing can't recover "I returned and saw under the sun..."
from "Objective considerations of contemporary phenomena compel the conclusion...", it's wrong.

## Quick reference: when to read additional files

| Need | Read |
|------|------|
| The four faults in full, with the famous quotes & the "insincerity" thesis | `references/fault-taxonomy.md` |
| Lookup list of dying/dead metaphors to flag | `references/dying-metaphors.md` |
| Operator-phrase → plain-verb table, pretentious-diction & padding lists, "-ize"/"not un-" rules | `references/false-limbs.md` |
| Detector mode: euphemism & evasion analysis on political/corporate text, the "pacification" examples | `references/detector-mode.md` |
| Worked before/after edits, incl. the Ecclesiastes demolition both directions | `examples/before-after.md` |
