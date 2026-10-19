# Proofreading Checklist

Proofread of the corrections (`\mccorrect{...}` / `mccorrection`) plus a sweep for
egregious errors elsewhere. Work through group by group; say which numbers to apply and
I'll edit only those.

Status markers: `[ ]` todo, `[x]` applied, `[-]` rejected, `[?]` needs a decision.

## Workflow — Claude must follow this

**This file is the running log. Keep it in step with the thesis after every single edit.**

For each item:

1. **Apply** the edit with the Edit tool, one item at a time.
2. **Re-read the changed lines after the edit is accepted.** Michael often amends the wording
   in the diff view before accepting, so the text in the file may differ from what was
   proposed. Never assume the proposal is what landed.
3. **Check whether the original error actually went away**, and whether the amendment
   introduced anything new (agreement, tense, a stray word, broken braces or refs).
   If an error persists, say so and keep the item open with `[?]`.
4. **Update this file immediately**: flip the marker, change "Fix:" to "Applied:" with the
   wording that *actually* landed, and add a short `Note:` if it differs from the proposal
   or if anything is still outstanding.
5. **If an edit is rejected, log it**: mark `[-]`, and record Michael's stated reason verbatim
   under a `Rejected:` line so the decision isn't revisited later.
6. **Keep iterating on the same item** until either (a) the text is genuinely correct and I am
   happy with it, or (b) Michael says explicitly to stop iterating on it. A rejection or an
   amendment is not a reason to move on; it is new information about what he wants. Propose the
   next wording, honouring his stated preference and making the smallest change that also fixes
   whatever is still wrong. Only mark `[x]` once the item is actually settled — use `[?]` while
   anything remains open, and say plainly in chat what is still outstanding.

Do not batch several items and reconcile the log afterwards — the log goes stale and
amendments get missed. One edit, one check, one log update.

### When to wrap a fix in `\mccorrect{}`

The blue markings exist **to show the examiner where to look**, not to track every keystroke.
So from Group C onwards this is context dependent:

- **Grammar, spelling, punctuation and consistency fixes: do not mark.** Edit the text in place,
  even when it sits outside an existing correction. Michael is not bothered about marking these,
  and marking them would bury the substantive corrections in noise.
- **Substantive changes: mark.** Anything that alters meaning, adds or withdraws a claim, changes
  a cross-reference the examiner was pointed at, or responds to an examiner comment goes inside
  `\mccorrect{}` or an `mccorrection` block.
- **Pre-existing punctuation stays outside the braces** when extending an existing correction
  (the convention Michael set on **B15**).
- If an item is genuinely borderline, ask rather than guess.

A2 is the worked example: proposed one wording, Michael rejected it with a reason, the
replacement was amended again in the diff view, and both the final text and the residual
agreement question are recorded on the item.

**Groups**

| Group | Scope | Count |
|---|---|---|
| [A](#group-a--errors-inside-corrections) | Outright errors **inside** corrections | 8 — **all applied** |
| [B](#group-b--clarity-and-grammar-inside-corrections) | Clarity/grammar **inside** corrections | 25 — **all applied** |
| [C](#group-c--errors-immediately-adjacent-to-corrections) | Errors immediately **adjacent** to corrections | 6 — **all applied** |
| [D1](#group-d1--egregious-errors-elsewhere-outside-corrections) | Egregious errors **elsewhere** | 13 — **all applied** |
| [D2](#group-d2--consistency-and-polish-elsewhere) | Consistency/polish **elsewhere** | 7 — **all applied** |

Two global checks passed: no `hyperparameter`/`hyper-parameter` remains in body text, and
there are no leftover `\todo`/`\odot` markers (the one `app:TODO` label is in
[appendix.tex](text/appendix.tex), which is not `\include`d).

---

## Group A — Outright errors inside corrections

**All applied.** Verify in the next build.

- [x] **A1.** [ch2-background.tex:1350](text/ch2-background.tex#L1350) — wrong word
  - Was: "which recovers the Pareto front **is** the utopian point $\ruto$ is appropriately set"
  - Applied: `is` → `if`

- [x] **A2.** [ch4-dents.tex:1907](text/ch4-dents.tex#L1907) — missing conjunction
  - Was: "the unique optimal policy **the** unique state assumptions (Assumptions … and …) remain"
  - Iteration 1, proposed: `the unique optimal policy and unique state assumptions`
  - **Rejected:** "I think this should be 'the unique optimal policy and the unique state assumption'"
  - Iteration 2, applied (Michael's wording, amended again in the diff view to move `remain` ahead
    of the parenthetical): `the unique optimal policy and the unique state assumption remain
    (Assumptions …)`. Left open: singular `assumption` against plural `remain`.
  - Iteration 3, **final**: `the unique optimal policy assumption and the unique state assumption
    remain (Assumptions \mbox{\ref{ass:2:unique_optimal_policy}} and
    \mbox{\ref{ass:2:unique_state_assumption}})`
  - Settled. One word added to Michael's wording. Both names now match their ch2 definitions
    verbatim ("the unique optimal policy **assumption**", "the unique state **assumption**"), and
    `remain` has two singular subjects, so the agreement is correct. Verified in context at
    [ch4-dents.tex:1907](text/ch4-dents.tex#L1907).

- [x] **A3.** [ch4-dents.tex:2173](text/ch4-dents.tex#L2173) — missing minus sign
  - Was: `2\exp\left(2\varepsilon^2m\right)`
  - The corollary it proves has $-2\varepsilon^2 N^n(s_t,a_t)$, so the bound was vacuous as written.
  - Applied: `2\exp\left(-2\varepsilon^2m\right)`

- [x] **A4.** [ch5-chmcts.tex:1275](text/ch5-chmcts.tex#L1275) — transposed words
  - Was: "the undominated values **recover can** the Pareto front"
  - Applied: `can recover`

- [x] **A5.** [ch5-chmcts.tex:1307](text/ch5-chmcts.tex#L1307) — undefined symbol
  - The sentence defines "a policy $\pi\in\Pi$ is *utility optimal* for weight $\bff{w}$ if", but the
    equation wrote $\bff{V}^{\pi^{\bff{w}}}(s_0)$, and $\pi^{\bff{w}}$ is never defined.
  - Applied: `u(\bff{V}^{\pi}(s_0); \bff{w}) = \max_{\pi'\in\Pi} u(\bff{V}^{\pi'}(s_0); \bff{w})`

- [x] **A6.** [ch5-chmcts.tex:1345](text/ch5-chmcts.tex#L1345) — agreement + hyphen (figure caption)
  - Applied: "and **passes** through" → `pass`; "the **pyramid like** contours" → `pyramid-like`

- [x] **A7.** [ch5-chmcts.tex:1387](text/ch5-chmcts.tex#L1387) — missing word in caption body
  - The caption body read "The consistent action problem"; the short caption already read
    "consistent action **selection** problem".
  - Applied: added `selection`

- [x] **A8.** [appendix-ch4-expr-deets.tex:331](text/appendix-ch4-expr-deets.tex#L331) — tense mismatch
  - Was: "it provides a C++ interface and **easily integrated** with the C++ implementation"
  - Applied: `and integrates easily with`

---

## Group B — Clarity and grammar inside corrections

### Chapter 2

- [x] **B1.** [ch2-background.tex:426](text/ch2-background.tex#L426) — "an alternative lens on reinforcement learning **that is taken** in this thesis"
  - Applied: `the alternative lens on reinforcement learning taken in this thesis`
  - Landed as proposed. `an` → `the` because the thesis takes one specific lens, and the section
    goes on to describe it. Verified in context.

- [x] **B2.** [ch2-background.tex:492](text/ch2-background.tex#L492) — Assumption 2.3.1 said the same thing three times
  - The motivation appeared at the lead-in ([L489](text/ch2-background.tex#L489), *outside* the
    correction: "To simplify the notation used for theory in this thesis"), then twice inside it:
    "is only made to **simplify the theoretical analysis** in this thesis" and "is made purely to
    **avoid unnecessary complexity in the proofs** in this thesis". Also "not a necessary
    **assumption**" repeated the noun.
  - Applied: dropped the second of the two inside sentences, kept the more specific "proofs" one,
    and changed `$\pi_1,\pi_2,\cdots$` → `$\pi_1,\pi_2,\ldots$` (centred dots are wrong for a
    comma list): `This assumption is not necessary; it is made purely to avoid unnecessary
    complexity in the proofs in this thesis.`
  - Landed as proposed. Nothing outside the correction was touched, so L489 still carries the
    motivation. Wording now matches Assumption 2.4.1 once **B12** is applied.

- [x] **B3.** [ch2-background.tex:615](text/ch2-background.tex#L615) — "an example of a **purely reinforcement learning** method"
  - Applied: `a pure reinforcement learning method` (adverb modifying a noun phrase → adjective)
  - Landed as proposed. Verified in context.

- [x] **B4.** [ch2-background.tex:617](text/ch2-background.tex#L617) — dangling relative clause
  - Was: "…from the *visit counts* at each node, **which** Corollary \ref{...} shows are tightly
    bounded…" — *which* attached to "visit counts" rather than to the estimates.
  - Applied: split into two sentences — `…from the \textit{visit counts} at each node. Corollary
    \ref{cor:4:bound_transition_distribution} shows that these estimates are tightly bounded
    around the true transition probabilities.`
  - Landed as proposed. Also shortens a very long sentence. Verified in context.

- [x] **B5.** [ch2-background.tex:619](text/ch2-background.tex#L619) — "neither **word** is used in the sense of…" (but *reinforcement learning* is two words)
  - Applied: `neither term`
  - Landed as proposed. Verified in context.

- [x] **B6.** [ch2-background.tex:1422](text/ch2-background.tex#L1422) — footnote tense
  - Applied: "it **is also assuming** a linear utility" → `it also assumes`
  - Landed as proposed. Matches the simple present used for CHVI elsewhere. Verified in context.

- [x] **B7.** [ch2-background.tex:1478](text/ch2-background.tex#L1478) — missing article
  - Applied: "because **linear utility** trades objectives off at a fixed rate" → `because a linear
    utility trades`
  - Landed as proposed. Verified in context.

- [x] **B8.** [ch2-background.tex:1480](text/ch2-background.tex#L1480) — comma splice
  - Was: "Diminishing returns cannot be expressed, although they are common in practice, the value of additional money being the standard example."
  - Iteration 1, proposed: `…although they are common in practice; the value of additional money is the standard example.`
  - **Rejected:** "ok, what I don't like too much about the edit is it sounds quite authorotative,
    while I have little/no experience on non-linear utilities (i just remember that its a common
    example)"
  - Iteration 2, **applied**: `…although they are common in practice, with the value of additional
    money being a commonly cited example.`
  - Settled. Adding `with` repairs the splice while keeping Michael's participial construction, and
    `the standard example` → `a commonly cited example` reports common usage instead of asserting
    it. Lesson for the rest of this pass: **do not convert a hedged construction into a flat
    assertion while fixing grammar** — fix the grammar and leave the epistemic strength alone.

- [x] **B9.** [ch2-background.tex:1481](text/ch2-background.tex#L1481) — stray `and` in the trailing list
  - Was: "Lexicographic preferences cannot be expressed, where any improvement in the first objective is preferred to any improvement in the second, **and** the second over the third and so on."
  - Iteration 1, applied then reconsidered: reordered to `Lexicographic preferences, in which …,
    cannot be expressed.` Correct, but it put 20 words between subject and verb and broke the
    parallel with the bullet above, which leads with "cannot be expressed".
  - Iteration 2, proposed a colon: `Lexicographic preferences cannot be expressed: any improvement …`
  - **Rejected:** "I agree with why you're not happy with it actually, but for some reason my brain
    still feels like it needs something like 'where' to attach the 1st/2nd/3rd/... ordering to
    lexicographic preferences"
  - Iteration 3, **final**: `Lexicographic preferences cannot be expressed, where any improvement in
    the first objective is preferred to any improvement in the second, the second over the third,
    and so on.`
  - Settled. Michael's `where` kept deliberately — the appositive `where` glossing a just-named term
    is standard in theses, and he finds it clearer than the colon. Scope narrowed to the one
    unambiguous nit: dropped the stray `and`, added the serial comma before `and so on`.
    Parallelism with the neighbouring bullet is preserved.

- [x] **B10.** [ch2-background.tex:1487](text/ch2-background.tex#L1487) — pointed at the wrong section
  - Was: cited `sec:5-6-2-linear_utility` for the iff claim, and read "…at each node, **which**
    Section … **shows holds** if and only if…".
  - Verified: Theorem `thm:per-step-linear` is at [ch5-chmcts.tex:1453](text/ch5-chmcts.tex#L1453),
    inside §5.6.3 "When Local Optimality Implies Global Optimality" (starts L1427). §5.6.2
    "Consistent Action Selection and the Linear Utility Assumption" (starts L1313) is the
    discussion. Section 1.2 already cites §5.6.3 for this same iff claim, so ch2 was the outlier.
  - Applied: `…using the reward-to-go at each node; Section
    \ref{sec:5-6-3-fundamental_assumption_of_momcts} shows that this holds if and only if the
    utility is linear.` (reference corrected, and the awkward "which … shows holds" split with a
    semicolon)
  - The other §5.6.2 reference in ch2, at [L1259](text/ch2-background.tex#L1259), is **correct and
    left alone** — it cites the discussion, not the theorem.

- [x] **B11.** [ch2-background.tex:1489](text/ch2-background.tex#L1489) — dropped word changed the meaning
  - Was: "The **scalarised** and expected scalarised returns criteria coincide" — the two criteria
    (SER and ESR, both named in Section 1.2) collapsed into one.
  - Applied: `The scalarised expected returns and expected scalarised returns criteria coincide`
  - Landed as proposed. Verified in context.

- [x] **B12.** [ch2-background.tex:697](text/ch2-background.tex#L697) — redundancy in Assumption 2.4.1
  - Applied (two sub-fixes):
    - [L697](text/ch2-background.tex#L697) "has a **single unique** path to reach it" → `a unique path`
    - [L699](text/ch2-background.tex#L699) "This assumption is not a necessary one, **is purely to**
      simplify notation **in this thesis**, and any results discussed **in this thesis**
      generalise…" → `This assumption is not necessary; it is made purely to simplify notation, and
      any results discussed in this thesis generalise to settings where it does not hold.`
      This fixes the dangling "is purely to", drops one of the two "in this thesis", and replaces
      the third and fourth "this assumption" with `it`.
  - Landed as proposed. Deliberately worded to match **B2** so Assumptions 2.3.1 and 2.4.1 now both
    open `This assumption is not necessary; it is made purely to …`.

### Chapter 3

- [x] **B13.** [ch3-litreview.tex:121](text/ch3-litreview.tex#L121) — elliptical ending
  - Was: "it targets the ESR criterion under a known utility, **and so the known weights
    scenario**." — the second clause had no verb.
  - Applied: `and so considers the known weights scenario.`
  - Landed as proposed. Verified in context.

### Chapter 4

- [x] **B14.** [ch4-dents.tex:1406](text/ch4-dents.tex#L1406) — broken parallelism
  - Was: "Two factors contribute: the high bias parameters selected (Table …), **and that** every
    action is tried once…" — a noun phrase coordinated with a that-clause.
  - Applied: `and the fact that every action is tried once before any action is selected a second time`
  - Landed as proposed. Both factors are now noun phrases, and the following "The latter" still
    refers correctly. Verified in context.

- [x] **B15.** [ch4-dents.tex:1410](text/ch4-dents.tex#L1410) — ambiguous "it"
  - Was: "below the misalignment threshold for all maps **as it converges to an optimal policy**" —
    *it* read as the temperature parameter rather than MENTS, and the clause is giving the evidence
    for the claim.
  - Applied: `for all maps, \mccorrect{as MENTS converges to an optimal policy}, however …`
  - Note: amended in the diff view to put the comma *outside* the `\mccorrect{}` braces (I had
    proposed `maps\mccorrect{, as MENTS …}`). Renders identically; keeps pre-existing punctuation
    out of the blue highlighting. Good convention to follow for the rest of the pass.
  - **C1** is in the same sentence ("a larger search temperature … **to** MENTS" → `than MENTS`) and
    is still open, pending Group C.

- [x] **B16.** [ch4-dents.tex:1479](text/ch4-dents.tex#L1479) — missing comma / vague "all three"
  - Was: "UCT and H-MCTS performed similarly on every map **and** all three algorithms made little
    or no progress on the 4x16 map." — two independent clauses with no comma, and "all three" relied
    on the reader carrying MaxUCT over from the previous sentence.
  - Applied: `UCT and H-MCTS performed similarly on every map, and all three UCT-based algorithms
    made little or no progress on the 4x16 map.`
  - Landed as proposed. `UCT-based` ties "all three" back to the term this sentence opens with
    ("UCT-based algorithms can still be seen to converge to a local optimum"), so UCT, MaxUCT and
    H-MCTS are unambiguous without repeating the list.

- [x] **B17.** [ch4-dents.tex:2127](text/ch4-dents.tex#L2127) — figure caption, $p$ already *is* a probability
  - Was: "then the **probability mass of** $p(s_{t+1}|s_t,a_t)$ and empirical probability mass of
    $\frac{N^n(s_{t+1})}{N^n(s_t,a_t)}$ must be within $2\varepsilon$" — "the probability mass of
    $p$" is circular, and the second half was missing "the".
  - Applied: `then $p(s_{t+1}|s_t,a_t)$ and the empirical probability
    $\frac{N^n(s_{t+1})}{N^n(s_t,a_t)}$ must be within $2\varepsilon$ of each other.`
  - Landed as proposed. Both quantities are now named directly as probabilities of the same event.

- [x] **B18.** [ch4-dents.tex:2142](text/ch4-dents.tex#L2142) — overloaded sentence
  - Was: "Figure … **provides** the intuition behind how the DKW inequality leads to this corollary
    **bounding the true and empirical transition probabilities**, and where the $2\varepsilon$ term
    comes from." — the unpunctuated participle made a long restrictive modifier, leaving "and
    where …" stranded a long way from "the intuition behind".
  - Iteration 1, proposed cutting the gloss: `…leads to this corollary, and where the $2\varepsilon$
    term comes from.`
  - **Rejected:** "although verbose, i would like some plain english 'bounding true vs empirical
    probabilities' to remain, but grammatically and how it sounds (your correction) I am happy"
  - Iteration 2, **applied**: `Figure \ref{fig:dkw_diag} gives the intuition behind how the DKW
    inequality leads to this corollary, which bounds the true transition probabilities against the
    empirical ones. It also shows where the $2\varepsilon$ term comes from.`
  - Settled. Gloss kept but turned into a proper relative clause, and the $2\varepsilon$ point split
    into its own sentence so it is no longer stranded. Lesson: **a gloss that looks redundant to me
    may be deliberate plain-English scaffolding** — fix how it reads rather than removing it.

- [x] **B19.** [ch4-dents.tex:2155](text/ch4-dents.tex#L2155) — the `align` ended with a comma, then the next sentence began with a capitalised "Hence"
  - Applied: comma → full stop at the end of the displayed equation.
  - Landed as proposed. Verified in context.

### Chapter 5

- [x] **B20.** [ch5-chmcts.tex:920](text/ch5-chmcts.tex#L920) — "**Specifically** the following set of points is used"
  - Applied: `Specifically,`
  - Landed as proposed. Checked house style: all six other uses of "Specifically" in ch5 take a
    comma, so this now matches.

- [x] **B21.** [ch5-chmcts.tex:1262](text/ch5-chmcts.tex#L1262) — roadmap list punctuation was inconsistent
  - Was: items ended `.` / `;` / `;` / `.`
  - Applied: changed the first item's trailing `.` to `;`, giving `;` / `;` / `;` / `.`
  - Landed as proposed. Matches the roadmap lists used elsewhere in the thesis. Verified all four
    line endings.

- [x] **B22.** [ch5-chmcts.tex:1350](text/ch5-chmcts.tex#L1350) — tangled sentence, two real errors
  - Was: "…contours of the Chebyshev utility to highlight that **the Chebyshev utility** is not able
    to simultaneously assign a higher utility to the points $(5,0)$ and $(0,5)$ **than $(2,2)$ to
    achieve** the value of $(2.5,2.5)$." — `than $(2,2)$` was missing its `to`, and the trailing
    `to achieve …` dangled as a purpose clause when it is the condition that would be required.
  - Applied: `…along with contours of the Chebyshev utility, to highlight that it cannot
    simultaneously assign a higher utility to $(5,0)$ and $(0,5)$ than to $(2,2)$, which would be
    needed to achieve the value of $(2.5,2.5)$.`
  - Landed as proposed. Kept `simultaneously` (Michael's emphasis); pronouned the repeated "the
    Chebyshev utility" to `it`, antecedent immediately prior; added a comma before the purpose
    clause.

- [x] **B23.** [ch5-chmcts.tex:1396](text/ch5-chmcts.tex#L1396) — footnote, redundant pair
  - Was: "**Alternatively** the accrued reward could **also** be stored in the node" — "alternatively"
    and "also" pull against each other, and "Alternatively" needed its comma.
  - Applied: `Alternatively, the accrued reward could be stored in the node`
  - **Amended afterwards by Michael**, adding a reason clause to the end of the footnote. Final text:
    `\footnote{\mccorrect{Alternatively, the accrued reward could be stored in the node (changing the
    other component), but would not be compatible with transposition tables (Section
    \mbox{\ref{sec:2-4-2-thts}}), as the accrued reward depends on the path taken to reach the
    node.}}`
  - Checked: no errors introduced, and the addition is technically correct — a transposition table
    re-uses `node(s)` when a state is reached by another path
    ([ch2-background.tex:785](text/ch2-background.tex#L785)), so a path-dependent quantity stored
    there would be ambiguous. It also supplies the *why* the footnote previously lacked. Braces
    balance; the full stop remains outside `\footnote{}`.
  - Two things deliberately left alone: "the accrued reward" now appears twice, but the second
    mention is 20 words later behind a parenthetical and a reference, and `it` could read as the
    node or the table, so repeating the noun is clearer; and the elided subject of "would not be
    compatible" is still the reward rather than the scheme, which predates both edits.

### Chapter 6 / Chapter 1

- [x] **B24.** [ch6-simplexmaps.tex:629](text/ch6-simplexmaps.tex#L629) — item didn't match its introduction
  - The list is introduced with "so only the differences are given here:", but the first item read
    "Section \ref{sec:5-5-1-envs} describes the MOMDP environments used in the experiments" — a
    pointer back to Chapter 5, i.e. a *sameness* rather than a difference.
  - Applied: `\item \mccorrect{The MOMDP environments are the same as those described in Section
    \mbox{\ref{sec:5-5-1-envs}};}`
  - Landed as proposed, with a capital `The` so it matches the capitalisation of the other four
    items. Checked that "those environments" in the third item still refers back correctly.

- [x] **B25.** *(optional)* [ch1-intro.tex:34](text/ch1-intro.tex#L34) — "the work completed for this thesis" is a little heavy
  - Was: "This section **provides** the scope and setting of the work **completed for** this thesis."
  - Applied: `This section sets out the scope and setting of the work in this thesis.`
  - Landed as proposed. Verified in context.

---

## Group C — Errors immediately adjacent to corrections

These sit in unmarked text but are in or next to a sentence you already touched, so they
could be absorbed into the existing correction cleanly.

- [x] **C1.** [ch4-dents.tex:1410](text/ch4-dents.tex#L1410) — "a larger search temperature (i.e. $\alphadents(x)$) **to** MENTS"
  - Applied: `than MENTS`
  - Landed as proposed. **Left unmarked** — grammar only, per the marking convention above. Same
    sentence as **B15**, which is marked because it altered the claim.

- [x] **C2.** [ch5-chmcts.tex:1661](text/ch5-chmcts.tex#L1661) — "suggesting that a hierarchical representation **would may more scalable**"
  - Applied: `may be more scalable`
  - Also tidied the stray double space after "hierarchical" on the preceding line.
  - **Left unmarked** — grammar only. Verified in context.

- [x] **C3.** [ch5-chmcts.tex:1655](text/ch5-chmcts.tex#L1655) — sentence fragment
  - Was: "**Leaving** \stochq\ewe **to be** unsatisfactorily addressed empirically." — a participial
    phrase with no main verb.
  - Applied: `This leaves \stochq\ewe unsatisfactorily addressed empirically.`
  - Kept as its own sentence rather than folded into the previous one (my original proposal), which
    would have stacked two participials after "converging to locally optimal solutions". Adding the
    subject `This` is the smaller change and reads better.
  - **Kept "unsatisfactorily"** rather than softening to "only partly", per the **B8** lesson — it is
    a deliberate and candid self-assessment, not loose wording. Dropped only the redundant "to be".
  - **Left unmarked** — grammar only.

- [x] **C4.** [ch5-chmcts.tex:560](text/ch5-chmcts.tex#L560) — back-reference broken by the §5.1 restructure
  - Was: "the search policy is context-independent, which **as discussed in Section
    \ref{sec:5-1-intro}** leads to linear contextual cumulative regret." The restructured §5.1 never
    mentions regret, and the subsection that proved the result —
    `sec:5-6-1-context_independent_policies` — was cut (only a commented-out roadmap entry survives
    at [L1261](text/ch5-chmcts.tex#L1261); no proof or definition remains in the file).
  - **Resolved by Michael**, citing his own work instead of the dead cross-reference, and adding the
    `chmcts` bib entry (which genuinely was not in `references.bib` before). Final text:
    `which leads to linear cumulative contextual regret \cite{chmcts}.`
  - Word order fixed on my proofread: `contextual cumulative regret` → `cumulative contextual
    regret`, to match ch2's term "(cumulative) contextual regret"
    ([Definition at L271](text/ch2-background.tex#L271), `\ctxreg`). `cumulative` kept deliberately,
    because §5.6.4 defines contextual *simple* regret in the same chapter, so the distinction
    matters.
  - Verified: `chmcts` resolves to [references.bib:45](references.bib#L45) (Painter, Lacerda, Hawes,
    ICAPS 2020); exactly one bib entry, no duplicate; the dangling `sec:5-1-intro` is gone. Left
    unmarked, which is Michael's call — it restores support rather than changing the claim.
  - Declined (Michael): adding `(Definition \ref{def:2:contextual_regret})` as a pointer — "I dont
    think I actually define it in this thesis anymore, and I dont want to add that". The notion is
    therefore cited to the paper only, by choice.
  - **Correction to my own earlier reporting, recorded so the mistake is not repeated.** I first
    grepped, found no `chmcts` entry, and told Michael the paper was absent — that was *correct*.
    He then added the entry. On re-grepping I found it and wrongly "corrected" myself, blaming BSD
    grep for not honouring `\|` alternation. Tested: alternation works fine here. **The real lesson
    is about time, not tooling — the repo changes under me between tool calls, so a result that
    contradicts an earlier one usually means the file changed, not that the earlier check was
    broken. Check that before inventing a tooling explanation, and do not blame a tool without
    testing it.**
  - Related loose end from the same cut, not actioned:
    [ch1-intro.tex:83](text/ch1-intro.tex#L83) still carries a commented-out contribution line about
    generalising regret notions.

- [x] **C5.** [ch5-chmcts.tex:621](text/ch5-chmcts.tex#L621) — "solved value" used for the *unsolved* quantity
  - The quantity is defined at [L621](text/ch5-chmcts.tex#L621) as the **unsolved** value
    $\unsolved(s,a)$, where `0` means solved — so "solved value" inverts its meaning.
  - Applied, four instances, all → `unsolved value`:
    - [ch5-chmcts.tex:621](text/ch5-chmcts.tex#L621) "The solved value of a node is an upper bound…"
    - [ch5-chmcts.tex:635](text/ch5-chmcts.tex#L635) "The solved value of a chance node … expected
      solved values of its successor states" (two in one sentence)
    - [ch5-chmcts.tex:640](text/ch5-chmcts.tex#L640) "the expected solved value of the children"
    - [ch2-background.tex:1134](text/ch2-background.tex#L1134) "when computing the solved value of a
      chance node" — **a fourth instance the original sweep missed**, found by grepping after the
      ch5 fixes. Same quantity, same inversion.
  - **Left unmarked** — terminology consistency, per the marking convention.
  - Verified: `grep "solved value"` excluding `unsolved value` now returns nothing across all of
    `text/`.

- [x] **C6.** [ch5-chmcts.tex:1618](text/ch5-chmcts.tex#L1618) — clunky parenthetical next to a correction
  - Was: "should be consistent with each other **(or all actions consistent with a single weight
    vector)**" — the parenthetical had no verb.
  - Applied: `(that is, all consistent with a single weight vector)` — kept as a gloss (per the
    **B18** lesson) but given a proper appositive form, which removes the need for the missing verb.
  - **Left unmarked** — grammar only.
  - Deliberately did **not** touch the `, otherwise` comma splice later in the same sentence:
    [ch7-conclusion.tex](text/ch7-conclusion.tex) uses the identical phrasing ("consistent with each
    other, otherwise the search policy optimises for no particular objective"), so fixing one alone
    would put the chapter summary and the conclusion out of step. Worth doing to both, or neither.

---

## Group D1 — Egregious errors elsewhere (outside corrections)

Real errors of the "cab/can" class, found by sweeping the whole thesis.

- [x] **D1.1.** [ch6-simplexmaps.tex:96](text/ch6-simplexmaps.tex#L96) — **two adjacent references**, rendered as "Chapter 5 5.5"
  - Was: `The empirical results of Chapter \ref{ch:5-chmcts}` / `\ref{sec:5-5-results} highlight a
    failure case` — two `\ref`s juxtaposed across a line break with no connective.
  - Applied: `The empirical results of Chapter \ref{ch:5-chmcts} (Section \ref{sec:5-5-results})
    highlight a failure case for CHMCTS…` — kept **both** references, since both were evidently
    intended; only the connective was missing.
  - **Left unmarked** — typo fix.
  - Swept the whole of `text/` for other adjacent-`\ref` collisions with
    `grep -nE '\\ref\{[^}]*\}[ \t]*\\ref\{[^}]*\}'`: this was the only one.

- [x] **D1.2.** [appendix-ch4-expr-deets.tex:237](text/appendix-ch4-expr-deets.tex#L237) — **two errors in one sentence**
  - Applied both:
    - "can **instead** be incorporated into the backups **instead**" → dropped the second `instead`
    - "to be run with **an** without the $\mctsmode$ parameter" → `with and without`
  - **Left unmarked** — typo fixes. Verified in context.

- [x] **D1.3.** [appendix-ch4-expr-deets.tex:634](text/appendix-ch4-expr-deets.tex#L634) — "replacing the **used** of Shannon entropy $\cl{H}$"
  - Applied: `the use of`
  - **Left unmarked** — typo fix. Verified in context.

- [x] **D1.4.** [appendix-ch4-expr-deets.tex:248](text/appendix-ch4-expr-deets.tex#L248) — two problems
  - Applied both:
    - "but not used for the general presentation **to follow prior works presentation**" →
      `but are not used in the general presentation, which follows prior work`. Fixes the missing
      possessive and avoids repeating "presentation"; the relative clause carries the same meaning
      (the general presentation follows prior work, hence omits these counts).
    - "all backups **need to be of the** \textit{full backups}" → `need to be \textit{full backups}`
  - **Left unmarked** — grammar only. Verified in context.

- [x] **D1.5.** [appendix-ch4-theory.tex:477](text/appendix-ch4-theory.tex#L477) — **`\max` should be `\argmax`**
  - Was: `Let $a^*=\max_{a\in\cl{A}} Q^*(s_t,a)$`, but $a^*$ is then used as an *action* — in
    $\cl{A}-\{a^*\}$, in $Q^*(s_t,a^*)$ and in $\mQdents{\cdot}(s_t,a^*)$ — so as written it was set
    to a value, not an action.
  - Applied: `\argmax`
  - The parallel proof at [L552](text/appendix-ch4-theory.tex#L552) already had it right
    (`$a^*=\argmax_{a\in\cl{A}} Q^*(s_t,a)$`); both definitions in the file now agree. Grepped for
    other `a^*=\max` slips — none.
  - **Left unmarked** — typo in notation, not a change to the result. Say if you would rather maths
    corrections be marked for the examiner.

- [x] **D1.6.** [appendix-ch4-theory.tex:557](text/appendix-ch4-theory.tex#L557) — **squared term dropped**
  - The bound at [L554](text/appendix-ch4-theory.tex#L554) is $C_1\exp(-k_1 \varepsilon_1^2
    N^n(s_t))$. Substituting $\varepsilon_1=\Delta_{\cl{M}}/2$ gives $k_1\Delta_{\cl{M}}^2/4$, but
    the text said "(where $k_2=k_1\Delta_{\cl{M}}/2$)" — both the square and the factor of 4 were
    lost.
  - Applied: `$k_2=k_1\Delta_{\cl{M}}^2/4$`
  - Checked downstream: $k_2$ is thereafter only used as *some* positive constant (L562, L572, L586,
    ending in `$k'=k_2$` at L588), so the corrected value changes nothing that follows. **The
    theorem's conclusion is unaffected — this was a wrong constant, not a wrong result.** (The
    $k_2$ at L423–L435 is a different, locally scoped constant in another lemma; unrelated.)
  - **Left unmarked** — same question as D1.5 if you would prefer maths corrections marked.

- [x] **D1.7.** [appendix-ch4-theory.tex:160](text/appendix-ch4-theory.tex#L160) — **two collided clauses**
  - Was: "Firstly, a standard consequence of the union bound **is that** intersections over
    exponentially likely events are also exponentially likely (and conversely for unions over
    exponentially unlikely events) **will be useful**, and is stated explicitly for reference." —
    "a consequence … is that X" and "a consequence … will be useful" were spliced together, so the
    content clause had to serve both and the sentence had no coherent main verb.
  - Applied: `Firstly, a standard consequence of the union bound will be useful: intersections over
    exponentially likely events are also exponentially likely (and conversely for unions over
    exponentially unlikely events). It is stated explicitly for reference.`
  - All content kept; the colon carries the "is that" clause and "stated explicitly for reference"
    becomes its own sentence. Considered em-dashes instead, but that would have nested the existing
    parenthesis inside a dashed aside.
  - **Left unmarked** — grammar only.

- [x] **D1.8.** [appendix-ch4-theory.tex:300](text/appendix-ch4-theory.tex#L300) — two errors in one sentence
  - Applied: "The final line **follow** by considering **the when** $E'$ is true or false." →
    `The final line follows by considering when $E'$ is true or false.`
  - **Left unmarked** — typo fixes. Verified in context.

- [x] **D1.9.** [appendix-ch4-theory.tex:146](text/appendix-ch4-theory.tex#L146) — missing article
  - Applied: "**is smallest difference** in optimal values" → `is the smallest difference`
  - **Left unmarked** — typo fix. Verified in context.

- [x] **D1.10.** [appendix-ch4-theory.tex:119](text/appendix-ch4-theory.tex#L119) — stray apostrophe
  - Applied: "providing forward references to the **Lemma's** used" → `the lemmas used`
  - Lowercased deliberately. Checked the convention: capitalised `Lemmas` is used only when
    immediately followed by `\ref{}` numbers (naming specific lemmas); the generic plural is
    lowercase, as in "all of the preliminary lemmas". This is a generic reference.
  - **Left unmarked** — typo fix.

- [x] **D1.11.** [appendix-ch4-theory.tex:408](text/appendix-ch4-theory.tex#L408) — "**Following the similar reasoning** but using the lower bounds"
  - Applied: `Following similar reasoning`
  - **Left unmarked** — grammar only. Verified in context.

- [x] **D1.12.** [abbreviations.tex:296](text/abbreviations.tex#L296) — **doubled word**
  - Was: "The $D-1$ **simplex simplex** (with $D$ dimensions)**, or,** the set of possible weightings…"
  - Applied three fixes in the one line: deleted the doubled `simplex`; wrote the notation as
    `$(D-1)$-simplex` to match Definition 2.6.1 at
    [ch2-background.tex:1234](text/ch2-background.tex#L1234) (which uses exactly
    `$(D-1)$-simplex`), rather than the ambiguous `$D-1$ simplex`; and removed the stray comma in
    "or, the set".
  - **Left unmarked** — grammar and notation consistency.
  - `a MOMDP` on this same line is **D2.1**, handled separately.

- [x] **D1.13.** [ch6-simplexmaps.tex:53](text/ch6-simplexmaps.tex#L53) — comma splice in the chapter opener
  - Was: "values can be looked up faster**,** the number of stored values grows only where the weight
    space requires finer resolution, addressing…" — two independent clauses joined by a comma.
  - Applied: `values can be looked up faster, and the number of stored values grows only where the
    weight space requires finer resolution, addressing…`
  - **Left unmarked** — grammar only. Verified in context.

---

## Group D2 — Consistency and polish elsewhere

Lower priority. Each is a global find-and-replace unless noted.

- [x] **D2.1.** `a MOMDP` → `an MOMDP` — 4 instances, all in [abbreviations.tex](text/abbreviations.tex) (lines 103, 117, 296, 306). The rest of the thesis uses "an MOMDP", "an MDP" (25) and "an MCTS" (6).
  - Applied with `replace_all` on `abbreviations.tex`. Verified: no `a MOMDP` remains anywhere in
    `text/`, and all 7 occurrences now read `an MOMDP`.
  - **Left unmarked** — consistency fix.

- [x] **D2.2.** `a MOMCTS` → `an MOMCTS` — was split 7 vs 2
  - **Michael's decision:** "usually I say it with a 'mom', but I think I would like to write it
    (and is defensible) as the AN em-oh-em…". So `an` throughout, matching `an MOMDP`.
  - Applied with `replace_all` across [ch1-intro.tex](text/ch1-intro.tex),
    [ch5-chmcts.tex](text/ch5-chmcts.tex) and [ch7-conclusion.tex](text/ch7-conclusion.tex),
    including one instance inside a commented-out block in ch5 so it stays consistent if restored.
  - Verified: no `a MOMCTS` remains; all 9 occurrences now read `an MOMCTS`.
  - **Left unmarked** — consistency fix.
  - **Audited every acronym article in the thesis while here** (`grep -hoE "\b(a|an)
    [A-Z][A-Z-]{1,8}\b"`). The a/an rule is *phonetic*, not orthographic — it follows the opening
    sound of however the reader says the next word. Everything else was already correct and needs
    no change: `a UCB`, `a UCT`, `a CHMCTS`, `a THTS`, `a KL`, `a DST`, `a Q-` (consonant sounds);
    `a DENTS`, `a MENTS`, `a MAB` (pronounced as words); `an MDP`, `an MCTS`, `an EUM`, `an NHV`
    (vowel sounds). MOMCTS was the only inconsistent one.

- [x] **D2.3.** `Monte-Carlo` → `Monte Carlo` — 4 instances in [ch3-litreview.tex](text/ch3-litreview.tex) (lines 9, 51, 54, 93), including two section headings
  - Applied with `replace_all` on `ch3-litreview.tex`. The two headings are now
    `\section{Monte Carlo Tree Search}` and `\section{Multi-Objective Monte Carlo Tree Search}`,
    so the ToC and PDF bookmarks change too.
  - Verified: 51 unhyphenated instances; the only remaining `Monte-Carlo` is the **publication
    title** at [ch1-intro.tex:112](text/ch1-intro.tex#L112), deliberately left as published. The
    `chmcts` entry in [references.bib](references.bib#L45) likewise keeps its hyphen for the same
    reason.
  - **Left unmarked** — consistency fix.

- [x] **D2.4.** `Alpha Go Zero` → `AlphaGo Zero` — [ch4-dents.tex:1294](text/ch4-dents.tex#L1294) and [appendix-ch4-expr-deets.tex:617](text/appendix-ch4-expr-deets.tex#L617)
  - Applied. [ch2-background.tex:977](text/ch2-background.tex#L977) already used "AlphaGo Zero".
  - **Left unmarked** — consistency fix.

- [x] **D2.5.** `Kata Go` → `KataGo` — one instance, [appendix-ch4-expr-deets.tex:617](text/appendix-ch4-expr-deets.tex#L617)
  - Applied, in the same sentence as D2.4. Also trimmed the trailing whitespace on that line.
  - Verified both: no `Alpha Go` or `Kata Go` remains; spellings are now `AlphaGo` (2),
    `AlphaGo Zero` (3), `AlphaZero` (5), `KataGo` (5).
  - **Left unmarked** — consistency fix.

- [x] **D2.6.** `Alias method` → `Alias Method` — [ch4-dents.tex:1774](text/ch4-dents.tex#L1774) and [ch4-dents.tex:1789](text/ch4-dents.tex#L1789)
  - Applied with `replace_all` on `ch4-dents.tex`. Verified: all 19 instances now capitalised, none
    lowercase remaining (checked `alias method` too).
  - **Left unmarked** — consistency fix.

- [x] **D2.7.** Minor one-offs — three applied, one extra find, one declined:
  - [x] [ch2-background.tex:433](text/ch2-background.tex#L433) — "exploration-exploitation **trade
    off**" → `trade-off`. Verified: no unhyphenated "trade off" remains.
  - [x] [appendix-ch4-expr-deets.tex:184](text/appendix-ch4-expr-deets.tex#L184) — "considered in
    **section** \ref{...}" → `Section`. Verified: no lowercase cross-references remain anywhere
    (checked section/figure/chapter/table/equation/appendix/theorem/definition/lemma/corollary).
  - [x] [appendix-ch4-theory.tex:564](text/appendix-ch4-theory.tex#L564) — index mismatch, the
    quantifier at L562 binds $a_t$ but the visit-count superscript used $a$.
    Applied: `\mQdents{N^n(s_t,a_t)}(s_t,a_t)`.
    **Michael fixed [L572](text/appendix-ch4-theory.tex#L572) himself in parallel** and worried the
    change might not have saved before accepting mine — it did; the two edits landed side by side
    with nothing lost. L576–588 were checked and are correct as they stand: that block's sum binds
    `a`, a different quantifier, so `a` is right there.
  - [x] **Extra find, [appendix-ch4-theory.tex:581](text/appendix-ch4-theory.tex#L581)** — found while
    verifying the above. `\Pr(a = \argmax_{a'} \mQdents{N^n(s_t,a)}(s_t,a))` declared the dummy
    variable $a'$ but the body was in terms of $a$, so the argmax had no dependence on its own
    bound variable. Applied: `\argmax_{a'} \mQdents{N^n(s_t,a')}(s_t,a')`, matching the convention
    at [ch4-dents.tex:194](text/ch4-dents.tex#L194). Only instance of this in the file.
  - [-] **Declined:** [ch6-simplexmaps.tex:293-299](text/ch6-simplexmaps.tex#L293) and
    [L322-323](text/ch6-simplexmaps.tex#L322) state the same nearest-vertex assumption and
    LEB-conjecture justification twice, a page apart.
    **Michael's decision:** "Keep both, I will do a human proof read pass now, if when I get to it
    it seems off then I will ask for help correcting."
    Both left untouched. The repetition is defensible: the first mention ties the assumption to
    conformity, which is the condition that makes it hold, and
    [L350](text/ch6-simplexmaps.tex#L350) later notes that $k=1$ is insufficient on non-conforming
    triangulations.

---

## Group E — Raised after the main pass

- [x] **E1.** [abstract.tex:3](text/abstract.tex#L3) — the two senses of "objective" collided
  - **Michael's concern:** "what I'm looking for really is for it to be clear, and nevigate the
    ambiguous use of 'objective'. As the 'maximum entropy objective' refers to <expected return +
    entropy> function, but multi-objective refers to each vector component as an objective".
  - He had already added `function` to "the maximum entropy objective **function**". Mapping the
    remaining uses showed the collision was concentrated in one phrase: "re-introduces entropy as a
    **second objective** during planning" sits in the *single*-objective paragraph but borrows the
    multi-objective construction, so it reads as though DENTS makes the problem two-objective.
  - Applied:
    - `as a second objective during planning` → `as an exploration bonus during planning`. This is
      Michael's own vocabulary elsewhere: ¶3 of the abstract already says "the **entropy bonus**
      used by DENTS", and ch4 has "adding entropy estimates as an exploration bonus" and "entropy as
      an auxiliary exploration bonus rather than a primary objective".
    - `removing entropy from the objective` → `the objective \mccorrect{function}`, parallelling the
      disambiguated first mention. **Amended in the diff view to mark the added word** — Michael
      wrapped `function` in `\mccorrect{}` rather than leaving it unmarked as I had it. Reasonable:
      it is a clarity change worth showing the examiner, and the rest of the paragraph is marked.
  - Result: every bare "objective"/"objectives" in the abstract is now the reward-vector sense;
    the objective-function sense always carries `function` or an immediate gloss ("the standard
    objective **of maximising expected return**"). The paragraph openers "In the single-objective
    setting" / "In the multi-objective setting" do the rest of the signposting.
  - Note: amended in the diff view to move `an` *inside* the `\mccorrect{}` braces. Correct here —
    the article itself changed (`a second` → `an exploration`), so unlike the **B15** case it is not
    pre-existing text.

---

## Not flagged (checked, no change needed)

- `\mccorrect{convex}` at [ch6-simplexmaps.tex:129](text/ch6-simplexmaps.tex#L129) is correct — the value curve is a max of linear functions, hence convex.
- Bare `Gridworld` (7 instances) is always sentence-initial or in a title-case heading.
- Lowercase "value iteration" at [ch3-litreview.tex:76](text/ch3-litreview.tex#L76) and
  [ch6-simplexmaps.tex:136](text/ch6-simplexmaps.tex#L136) is generic usage, not the named algorithm.
- British spelling is consistent throughout (`-ise`/`-isation`, `behaviour`, `normalised`).
- No doubled words anywhere else in prose; no common misspellings found.
