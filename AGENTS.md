# Windowpane — agent instructions (cross-harness)

This file lets harnesses that read `AGENTS.md` (OpenAI Codex, Cursor, Windsurf, Aider, and others)
use the Windowpane writing discipline without the Claude Code plugin runtime. It is a condensed
entry point; the full craft lives in [`skills/orwell-prose/SKILL.md`](skills/orwell-prose/SKILL.md)
and its `references/` files, which you should read when doing real work.

## What this is

A discipline from George Orwell's "Politics and the English Language" with **two modes**:

- **Editor mode (default):** make sincere writing clearer. Cut padding and dead metaphors, prefer
  short Anglo-Saxon words over long Latinate ones, prefer the active voice, trim to the shortest
  *honest* version. Apply edits and report before→after with reasons.
- **Detector mode:** expose evasion in political/corporate/PR/marketing/bureaucratic text. Name
  what each euphemism, actor-deleting passive, or abstraction conceals. **Translate to expose —
  never rewrite evasive text to read "better," which only launders it.**

Pick by intent: "tighten / make clearer" → editor; "what is this hiding / analyze the spin" →
detector. If asked to "improve" an evasive text, ask which is wanted.

## Orwell's six rules (heuristics; rule 6 governs)

1. No metaphor/simile you're used to seeing in print.
2. No long word where a short one will do.
3. Cut any word you can cut.
4. No passive where the active works.
5. No jargon/foreign/scientific word with an everyday equivalent.
6. **Break any rule sooner than say anything outright barbarous.**

## The non-negotiable disciplines

- **Rule 6 is the linchpin.** Never strip a *correct* passive (actor unknown/irrelevant), jargon
  shared by specialists, or a long word with no true short synonym. Confirm each edit reads
  *better*, not merely shorter — revert it if not.
- **Never edit exempt text:** poetry, lyrics, intentional voice/dialect, dialogue, quotes, or
  legal boilerplate. Offer notes only.
- **Never invent specifics** to fill a vague claim. Mark `[needs detail]` and move on; the gap is
  itself the finding.
- **Be fair.** Credit concrete, working passages; separate earnest abstraction from bad-faith
  concealment. Vagueness can be honest imprecision.
- **Detector mode never launders.** A prettier press release hides better.

## The two roles (use as named personas)

- **prose-editor** — edits files for clarity (editor mode only). See
  [`agents/prose-editor.md`](agents/prose-editor.md).
- **prose-critic** — read-only notes + detector teardown; never edits. See
  [`agents/prose-critic.md`](agents/prose-critic.md).

## The test

For any suspect phrase: **can I picture it, measure it, or point to it?** Concrete language
survives; the four faults (dying metaphors, operators/false limbs, pretentious diction, meaningless
words) do not. Lookup tables: `skills/orwell-prose/references/`.
