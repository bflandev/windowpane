# Calibration evals

Regression checks for the `orwell-prose` skill. The skill's `examples/before-after.md` names the
behaviours that *must* hold — recover concreteness in editor mode, **refuse to launder** evasive
text, leave a correct passive alone, translate-to-expose in detector mode. This harness turns those
into a runnable pass/fail gate so a future edit to the skill can't quietly break them.

## How it works

For each case in [`cases.jsonl`](cases.jsonl):

1. **Run** the skill — `SKILL.md` is loaded as the system prompt and the case's `user` prompt is sent.
2. **Judge** — a second model call scores the output against the case's `must` / `must_not` rubric.
   A case **PASSes only if every `must` holds and no `must_not` does.**

The script exits non-zero if any case fails, so it drops straight into CI.

## Run it

```bash
./evals/run.sh                 # uses the `claude` CLI and the `sonnet` model
MODEL=opus ./evals/run.sh      # pick the model
CLAUDE_BIN=/path/to/claude ./evals/run.sh
```

Requires the `claude` CLI and `jq` on `PATH`. Each case costs two model calls (one to run, one to
judge).

## Adding a case

Append one JSON object per line to `cases.jsonl`:

```json
{"id":"short-slug","user":"the prompt sent to the skill","must":["thing that must be true"],"must_not":["thing that must not be true"]}
```

Keep `must` / `must_not` items concrete and individually checkable — the judge reads them literally.

## Scope / limitation

This tests the **skill's content** (`SKILL.md` as system prompt), not the plugin's install path or
the on-demand loading of `references/`. The four canonical cases are self-contained, so the rules in
`SKILL.md` are enough to judge them. It is a discipline regression gate, not an integration test of
plugin auto-discovery.
