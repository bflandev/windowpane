# Detector mode — exposing evasion, not editing it

This is the political half of Orwell's essay. Here you are not helping a sincere writer get
clearer; you are reading a text — political speech, press release, corporate memo, marketing copy,
bureaucratic notice, PR statement, terms-of-service — to find **where it is avoiding meaning, and
why.**

> "Political language ... is designed to make lies sound truthful and murder respectable, and to
> give an appearance of solidity to pure wind." — Orwell

> "In our time, political speech and writing are largely the defence of the indefensible. ...
> Thus political language has to consist largely of euphemism, question-begging and sheer cloudy
> vagueness." — Orwell

**Critical difference from editor mode:** do **not** rewrite the text into better prose. A
prettier version *launders* it. Instead, **translate it** — render each evasive move into the
blunt, concrete statement it is dodging, so the reader sees the gap. You are a decoder, not a
ghostwriter.

## Orwell's worked example — keep it as the calibration target

> "Defenceless villages are bombarded from the air, the inhabitants driven out into the
> countryside, the cattle machine-gunned, the huts set on fire with incendiary bullets: this is
> called **pacification**."

> "Millions of peasants are robbed of their farms and sent trudging along the roads ...: this is
> called **transfer of population** or **rectification of frontiers**."

The method: name the euphemism, then state the physical reality it covers. Do that for every
flagged phrase.

## The evasion taxonomy — tag each finding

1. **Euphemism** — a soft phrase covering a hard reality. *Downsizing / rightsizing* (firing),
   *let go* (fired), *enhanced interrogation* (torture), *collateral damage* (killed civilians),
   *negative patient outcome* (death), *revenue enhancement* (tax), *pre-owned* (used),
   *correctional facility* (prison), *food insecurity* (hunger). → Translate to the hard word.
2. **Agentless passive / actor-deletion** — the construction that hides *who did it*. "Mistakes
   were made." "The funds were misallocated." "Lives were lost." Ask: **by whom?** Name the
   missing subject the sentence is built to omit.
3. **Nominalization as concealment** — turning an action into an abstract noun so no one has to
   own it: *there was a restructuring*, *following the reduction in headcount*, *the situation
   evolved*. Recover the verb and its actor.
4. **Abstraction / meaningless words** — *values, freedom, security, the community, stakeholders,
   reform, modernize, streamline.* Ask: whose? defined how? measured as what? Name the missing
   concrete referent. (See `fault-taxonomy.md` §4.)
5. **Dead metaphor as thought-stopper** — *take the necessary steps, a line in the sand, send a
   message, robust framework.* These let the writer (and reader) skip past the absent specifics.
6. **Inflated / honorific diction** — grand vocabulary masking a thin or ugly fact (*strategic
   realignment, mission-critical synergies, a journey, our people*). Strip to the fact.
7. **Question-begging** — phrasing that assumes the contested point (*common-sense reforms*,
   *necessary sacrifices*, *responsible cuts*, *the only realistic option*). Name the assumption
   smuggled in.
8. **Quantifier fog / weasel words** — *some say, critics argue, up to 50% off, results may vary,
   helps support, as much as, virtually.* Name what the hedge lets the claim avoid committing to.
9. **Internal contradiction / fails-its-own-thesis** — the text violates the very principle it
   preaches, or two of its claims can't both be true. A manifesto preaching *simplicity* in
   sprawling abstract prose; a memo praising *transparency* while deleting every actor; a brand
   selling *clarity* whose own pitch is unpicture-able; "we value candor" beside "mistakes were
   made."
   This is often the single most damning finding, because the gap between declared aim and actual
   practice is *demonstrated by the text itself* — you don't have to infer intent, you just hold
   the two parts up against each other. **How to flag:** (a) state the thesis/value the text
   declares, in its own words; (b) quote where the text's own language or structure does the
   opposite; (c) name the contradiction in one line. Look for it especially in manifestos,
   mission statements, thought-leadership, and any text whose subject *is* communication,
   honesty, simplicity, or alignment — those put the standard in writing, then miss it.

## Workflow

1. **State the text's purpose and who is speaking to whom** — detection needs the rhetorical
   situation (a layoff memo and a campaign speech hide different things).
2. **Quote each evasive move**, tag it with one of the eight categories above.
3. **Translate** — write the plain, concrete sentence the original is avoiding. For passives and
   nominalizations, *supply the missing actor* (mark it `[actor unstated]` if genuinely unknowable
   from the text).
4. **Name what is concealed** in one line: the firing, the death, the cost, the responsible
   party, the contested assumption.
5. **Run the contradiction check (category 9) explicitly.** Before summarizing, ask: *does this
   text obey its own stated standard?* State its declared thesis/value, then test the text's own
   language and length against it. If it fails its own thesis, that is usually your headline
   finding.
6. **Summarize the overall move** — what is the gap between the text's "real and declared aims"?
   What would a reader believe that isn't true? Keep this evidence-based and quote-anchored; you
   are diagnosing language, not mind-reading motives beyond what the words show.

## Output shape

A table or list of `quote → category → plain translation → what it conceals`, then a short
paragraph naming the document's central evasion. Optionally, an honest rewrite **only if the user
explicitly asks** "what would this say if it were honest?" — and label it clearly as a
counterfactual, not an improvement of their text.

## Guardrails

- Stay anchored to the text. Flag what the *words* do; don't impute intent the language doesn't
  support. "This construction hides the actor" is defensible; "they are lying because they are
  evil" is not your job.
- Vagueness is not always dishonesty — sometimes it's haste or genuine uncertainty. Note the
  difference where you can ("this may be hedging genuine uncertainty rather than evasion").
- This is for analyzing **public/institutional/persuasive** text. Don't turn it on a person's
  private writing to "expose" them unless that's clearly the task.
