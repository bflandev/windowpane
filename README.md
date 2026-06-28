<div align="center">

<img src="assets/logo.svg" width="120" alt="Windowpane logo" />

# Windowpane

**Prose you can see through.**

*"Good prose is like a windowpane."* — George Orwell

</div>

---

Windowpane is a small, focused writing plugin for AI coding harnesses. It turns George Orwell's
1946 essay **"Politics and the English Language"** into a working editorial discipline — one that
both **makes sincere writing clearer** and **exposes evasion in writing that dodges meaning.**

It ships as **one skill** and **two agents**:

| Component | What it does |
|-----------|--------------|
| **`orwell-prose`** (skill) | The craft layer: Orwell's six rules, the four-fault taxonomy, two modes (editor + detector), worked examples. Everything else builds on it. |
| **`prose-editor`** (agent) | *Edits* sincere prose in a file for clarity — cuts padding, dead metaphors, jargon, needless passives; reports before→after. Read-write. |
| **`prose-critic`** (agent) | *Critiques* read-only — gives clarity notes, and runs **detector mode** to expose euphemism, spin, and bad-faith vagueness in political/corporate/PR/marketing text. Never edits. |
| **`/proofread`**, **`/unspin`** | Slash commands that invoke the two modes directly. |

The split is deliberate: **the editor that improves sincere prose must refuse to "improve"
insincere prose**, because a tighter lie is a better lie. Point `prose-editor` at a layoff memo and
it stops and hands you to `prose-critic`.

**Command or agent?** Same discipline, different reach. Use the **commands** (`/proofread`,
`/unspin`) for a quick pass in the current conversation, on text you've pasted or a file you're
already looking at. Use the **agents** (`prose-editor`, `prose-critic`) when you want the work done
in its own context — a larger doc, a batch, or a step inside a bigger task — so the analysis doesn't
crowd your main thread. The agents also self-trigger on plain edit/review requests; the commands are
explicit.

## The discipline

**Orwell's six rules** (heuristics, not laws — rule 6 governs the rest):
1. Never use a metaphor/simile you're used to seeing in print.
2. Never use a long word where a short one will do.
3. If it's possible to cut a word out, cut it out.
4. Never use the passive where you can use the active.
5. Never use jargon/foreign/scientific words if an everyday equivalent exists.
6. **Break any of these rules sooner than say anything outright barbarous.**

**The four faults:** dying metaphors · operators / verbal false limbs · pretentious diction ·
meaningless words. Detector mode adds a 9-category evasion taxonomy (euphemism, actor-deleting
passive, nominalization, abstraction, dead-metaphor-as-thought-stopper, inflated diction,
question-begging, quantifier fog, and **internal contradiction / fails-its-own-thesis**).

The guiding test for any suspect phrase: **can I picture it, measure it, or point to it?**

## Install

### Claude Code (native)

```
/plugin marketplace add bflandev/windowpane
/plugin install windowpane@windowpane
```

Or clone and load locally:

```
git clone https://github.com/bflandev/windowpane.git
/plugin marketplace add ./windowpane
/plugin install windowpane@windowpane
```

Then just write naturally — *"tighten this README"*, *"what is this press release hiding?"* — or
use `/proofread` and `/unspin`. The agents trigger on review/edit requests; the skill loads its own
reference files on demand.

### Other harnesses (Codex, Cursor, etc.)

There is **no universal cross-harness plugin standard** — Claude Code's plugin format is the one
this repo targets natively. But the substance here is plain Markdown prompts, so it ports:

- **OpenAI Codex / Cursor / Windsurf / Aider:** the root [`AGENTS.md`](AGENTS.md) carries the core
  discipline in the convention those tools read. Point your agent file at it, or paste
  [`skills/orwell-prose/SKILL.md`](skills/orwell-prose/SKILL.md) into your project rules.
- **Anything else (xAI/Grok, a custom agent):** load `SKILL.md` as a system prompt and the two
  agent files as named personas. The reference files under `skills/orwell-prose/references/` are
  the lookup tables they draw on.

## Write this way by default (optional)

The skill and agents act on text you hand them. If you also want Claude's *own* prose to follow
Orwell's rules by default — in this and every project — add one line to your `CLAUDE.md`
(`~/.claude/CLAUDE.md` for all projects, or a project-level `CLAUDE.md` for just one):

```markdown
Write prose in plain English: short, concrete words; the active voice; no dead metaphors, no
padding, no jargon where an everyday word works. But this is a preference, not a mechanical rule —
keep a passive when the actor is unknown or beside the point, keep a long word or a term of art
when no short word carries the same meaning, and keep clarity over brevity when they conflict.
Never strip a sentence into something stilted, ambiguous, or wrong just to make it plainer.
```

The second half matters: Orwell's Rule 6 — *"break any of these rules sooner than say anything
outright barbarous"* — is what keeps a plain-English instruction from turning into a mechanical
strip-the-passives pass that produces prose as dead as what it replaced. This is a personal config
choice, not something the plugin enforces.

## Repository layout

```
windowpane/
├── .claude-plugin/
│   ├── plugin.json          # plugin manifest
│   └── marketplace.json     # makes this repo installable as a marketplace
├── agents/
│   ├── prose-critic.md      # read-only critic + detector
│   └── prose-editor.md      # file-editing copy-editor
├── commands/
│   ├── proofread.md         # /proofread → editor mode
│   └── unspin.md            # /unspin → detector mode
├── skills/orwell-prose/
│   ├── SKILL.md
│   ├── references/          # fault-taxonomy, false-limbs, dying-metaphors, detector-mode
│   └── examples/before-after.md
├── evals/                   # runnable calibration regression gate (run.sh + cases.jsonl)
├── assets/logo.svg
├── docs/DESIGN.md           # why it's built this way + validation
├── AGENTS.md                # cross-harness entry point
└── LICENSE
```

## Credits

Built on George Orwell's **"Politics and the English Language"** (1946), which is in the public
domain in many jurisdictions. Windowpane is an independent tool and is not affiliated with the
Orwell Estate or the Orwell Foundation. Plugin code and prompts © 2026 Brian Flanagan, MIT
licensed — see [LICENSE](LICENSE).
