#!/usr/bin/env bash
# Calibration eval for the orwell-prose skill.
#
# For each case in cases.jsonl: run the skill (SKILL.md loaded as the system prompt)
# against the case's user prompt, then have a second model call judge the output
# against the case's must / must_not rubric. PASS only if every `must` holds and no
# `must_not` does. Exits non-zero if any case fails — wire it into CI as a regression gate.
#
# Requires: claude CLI, jq.  Override the model with MODEL=... ; the binary with CLAUDE_BIN=...
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_FILE="$ROOT/skills/orwell-prose/SKILL.md"
CASES="${CASES:-$ROOT/evals/cases.jsonl}"
CLAUDE_BIN="${CLAUDE_BIN:-claude}"
MODEL="${MODEL:-sonnet}"
JUDGE_MODEL="${JUDGE_MODEL:-opus}"   # judge with a different/stronger tier than the generator

command -v "$CLAUDE_BIN" >/dev/null || { echo "error: '$CLAUDE_BIN' not found on PATH" >&2; exit 2; }
command -v jq >/dev/null || { echo "error: jq not found on PATH" >&2; exit 2; }
[ -f "$SKILL_FILE" ] || { echo "error: $SKILL_FILE missing" >&2; exit 2; }
[ -f "$CASES" ] || { echo "error: $CASES missing" >&2; exit 2; }

SKILL_PROMPT="$(cat "$SKILL_FILE")"
pass=0; fail=0; failed_ids=()

run_model() { # $1 = user prompt, $2 = system prompt, $3 = model (default $MODEL) -> model reply
  "$CLAUDE_BIN" -p "$1" --model "${3:-$MODEL}" --append-system-prompt "$2" 2>/dev/null
}

while IFS= read -r line; do
  [ -z "$line" ] && continue
  id="$(jq -r '.id' <<<"$line")"
  user="$(jq -r '.user' <<<"$line")"
  must="$(jq -r '.must | to_entries[] | "  MUST: \(.value)"' <<<"$line")"
  mustnot="$(jq -r '.must_not | to_entries[] | "  MUST NOT: \(.value)"' <<<"$line")"

  printf '%-22s ' "$id"

  output="$(run_model "$user" "$SKILL_PROMPT" || true)"
  if [ -z "$output" ]; then
    echo "FAIL — skill produced no output"; fail=$((fail+1)); failed_ids+=("$id"); continue
  fi

  judge_sys="You are a strict evaluator. Judge ONLY whether the skill output satisfies the rubric. Reply with a single JSON object and nothing else: {\"verdict\":\"PASS\"|\"FAIL\",\"reason\":\"one sentence\"}. Verdict is PASS only if every MUST item holds AND no MUST NOT item holds."
  judge_user="RUBRIC:
$must
$mustnot

SKILL OUTPUT:
$output"

  verdict_json="$(run_model "$judge_user" "$judge_sys" "$JUDGE_MODEL" | tr -d '\000' | grep -o '{"verdict"[^}]*}' | head -1 || true)"
  verdict="$(jq -r '.verdict // "FAIL"' <<<"$verdict_json" 2>/dev/null || echo FAIL)"
  reason="$(jq -r '.reason // "unparseable judge response"' <<<"$verdict_json" 2>/dev/null || echo "unparseable judge response")"

  if [ "$verdict" = "PASS" ]; then
    echo "PASS"; pass=$((pass+1))
  else
    echo "FAIL — $reason"; fail=$((fail+1)); failed_ids+=("$id")
  fi
done < "$CASES"

echo "----"
echo "passed: $pass   failed: $fail"
if [ "$fail" -gt 0 ]; then
  echo "failing: ${failed_ids[*]}"
  exit 1
fi
