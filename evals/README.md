# Calibration evals

Regression checks for the `orwell-prose` skill. The skill's `examples/before-after.md` names the
behaviours that *must* hold — recover concreteness in editor mode, **refuse to launder** evasive
text, leave a correct passive alone, translate-to-expose in detector mode. This harness turns those
into a runnable pass/fail gate so a future edit to the skill can't quietly break them.

## How it works

For each case in [`cases.jsonl`](cases.jsonl):

1. **Run** the skill — `SKILL.md` is loaded as the system prompt and the case's `user` prompt is sent.
2. **Judge** — a second model call (a *different* tier — see `JUDGE_MODEL`) scores the output against
   the case's `must` / `must_not` rubric. A case **PASSes only if every `must` holds and no
   `must_not` does.**

The script exits non-zero if any case fails, so it drops straight into CI.

The 12 cases cover both modes and the disciplines the skill claims: concreteness recovery
(Ecclesiastes), the launder-refusal guard, the legitimate-passive guard, each core fault category
(dying metaphor, verbal false limb), the editor-mode refusal paths (poetry, legal boilerplate), the
detector translate-to-expose, the §9 internal-contradiction check *firing* and correctly *not
firing*, and detector positive tests (must not invent concealment in honest abstraction; must still
analyze a terms-of-service line).

## Run it

```bash
./evals/run.sh                       # generate with `sonnet`, judge with `opus`
MODEL=opus ./evals/run.sh            # change the generator model
JUDGE_MODEL=sonnet ./evals/run.sh    # change the judge model
CLAUDE_BIN=/path/to/claude ./evals/run.sh
```

Requires the `claude` CLI and `jq` on `PATH`. Each case costs two model calls (one to run, one to
judge). The judge runs on a different tier from the generator (`JUDGE_MODEL` defaults to `opus`) so
the skill isn't grading its own homework with identical weights.

## Adding a case

Append one JSON object per line to `cases.jsonl`:

```json
{"id":"short-slug","user":"the prompt sent to the skill","must":["thing that must be true"],"must_not":["thing that must not be true"]}
```

Keep `must` / `must_not` items concrete and individually checkable — the judge reads them literally.

## Scope / limitation

This tests the **skill's content** (`SKILL.md` as system prompt), not the plugin's install path or
the on-demand loading of `references/`. The cases are self-contained, so the rules in `SKILL.md` are
enough to judge them. It is a discipline regression gate, not an integration test of plugin
auto-discovery.

**Out of scope by necessity, not neglect:** the two agents (`prose-editor`, `prose-critic`) and the
two commands (`/proofread`, `/unspin`) are *not* exercised here — testing them would require a live
Claude Code session that dispatches the agent and asserts the `Skill` tool fired. They are short,
readable wrappers around this skill and are verified manually on each change. This harness gates the
craft; the wiring is a manual smoke test.
