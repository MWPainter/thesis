# Cover Letter Proofreading Checklist

Review of [CORRECTIONS_COVER_LETTER.md](CORRECTIONS_COVER_LETTER.md): reference verification,
proofreading, and format options.

> **Status: Format C applied to all 25 entries.** V2–V5 fixed, Group W folded in during the
> reformat. Outstanding: **Group P** (page numbers, Michael's pass), the **Equation 5.12 vs 5.13**
> question in V3, and a completeness check against the examiner's report.

Status markers: `[ ]` todo, `[x]` applied, `[-]` rejected, `[?]` needs a decision.

## Workflow — Claude must follow this

Same rules as [CLAUDE_PROOF.md](CLAUDE_PROOF.md):

1. **Apply** one item at a time with the Edit tool.
2. **Re-read the changed lines after the edit is accepted** — Michael often amends wording in the
   diff view, so what landed may differ from what was proposed.
3. **Check the original problem actually went away**, and that the amendment introduced nothing new.
4. **Update this file immediately** with the wording that *actually* landed.
5. **Log rejections** with Michael's stated reason verbatim under `Rejected:`.
6. **Keep iterating** on an item until it is genuinely right or Michael says stop.

**Thesis edits are off the table** unless genuinely essential — Michael has built the cover letter's
page references against the current build, so changing the thesis moves them. Prefer fixing the
cover letter. Flag anything that looks like it needs a thesis change rather than doing it.

---

## How the references were verified

The thesis was built clean (`pdflatex` → `bibtex` → `pdflatex` ×2, exit 0, **zero undefined
references or citations**). A label → printed-number → page map was extracted from
`Oxford_Thesis.aux` and `text/*.aux` (645 labels) and each claim in the letter checked against it.

**Note the label/number offset.** Labels are named one section ahead of what prints, because ch5 has
no `5.4`-named label and ch6 none for `6.4.1`:

| Label | Prints as | Page |
|---|---|---|
| `sec:5-5-results` | **5.4** | 144 |
| `sec:5-5-2-eval_procedure` | **5.4.2** | 147 |
| `sec:5-5-3-results_and_discussion` | **5.4.3** | 149 |
| `sec:5-6-theory` | **5.5** | 156 |
| `sec:5-6-3-fundamental...` | **5.5.3** | 162 |
| `sec:6-4-0-eval_procedure` | **6.4.1** | 182 |
| `sec:6-4-1-results_and_discussion` | **6.4.2** | 182 |
| `sec:6-4-2-scalability` | **6.4.3** | 185 |

The letter correctly uses printed numbers throughout. This offset is the likely source of the
section-number slips in **V4** and **V5** below.

**What could not be verified:** whether any examiner comment is *missing* from the letter. The letter
contains 25 quoted comments; without the original examiner report there is no way to check
completeness. Worth one manual pass against the report.

---

## Group V — Confirmed number errors

**Every** section, figure, equation, definition, theorem, assumption and appendix number in the
letter was checked against the aux. Only the four below are wrong; all the rest are correct,
including the easily-confused `5.5.x` theory numbering. Page numbers are **Michael's final pass**
(see Group P) — these are labelled objects, so they are authoritative.

- [x] **V1.** [Line 243](CORRECTIONS_COVER_LETTER.md#L243) — `P148: concave -> convex`, was "Updated (page 148)"
  - Page 148 is in ch5 §5.4.2 — unrelated. The `concave`→`convex` fix is the value-curve sentence in
    ch6. Looks like the examiner's *old* submission page number was echoed into the response.
  - **Fixed by Michael: `page 170`**, checked against the PDF.
  - I had estimated p169 from `fig:6:value_curve`. Michael's number is the one to trust: the aux
    records where the **figure float** landed, and the prose discussing it can sit on the following
    page. Lesson for the rest of this review: **aux page numbers are authoritative for labelled
    objects only** — for page numbers of ordinary prose, the PDF is the only reliable source.

- [x] **V2.** P134 — was "(Section 5.3.6 and **Equation 5.41**)"
  - Equation 5.41 is `complete(ψ)`, the recommendation policy on p148. The size-pruning crowding
    distance is **Equation 5.40** (p143).
  - Applied: `Equation 5.40`

- [?] **V3.** P134 — was "old (incorrect) version of the recommendation policy (**Equation 5.14**)"
  - Equation 5.14 is the CHMCTS value backup (p137), not CZT's recommendation policy.
  - Applied: `Equation 5.12` — **but this is unconfirmed.** CZT's recommendation policy is
    *unlabelled*, so it cannot be resolved from the aux; it sits between Equation 5.11 (p135) and
    Equation 5.14 (p137), making it **5.12 or 5.13**.
  - **Open for Michael:** count the equations on p135 and confirm 5.12 vs 5.13.

- [x] **V4.** P134 — was "end of the gymnasium section of **Section 5.5.3**"
  - §5.5.3 is the *theory* subsection "When Local Optimality Implies Global Optimality" (p162). The
    gymnasium results are **§5.4.3**.
  - The letter used "5.5.3" *correctly* elsewhere for the theory subsection, so the same number was
    doing two jobs — one right, one wrong. This is the label/number offset biting.
  - Applied: `Section 5.4.3`

- [x] **V5.** P134 — was "a reference from **Section 6.4.1**"
  - §6.4.1 is the evaluation procedure. The paragraph pointing back at the non-monotonic explanation
    is in **§6.4.2**, the results and discussion.
  - Applied: `Section 6.4.2`

---

## Group P — Page references (Michael's final pass)

75 page references in the letter. Page numbers for ordinary prose cannot be verified from the aux,
so these are for the manual pass. Four of them **contradict a labelled anchor**, so they are worth
checking first:

- [ ] **P1.** [L194](CORRECTIONS_COVER_LETTER.md#L194) — "third paragraph of Section 5.2 (**also page 128**)".
  §5.2 begins on p132, and the bullet immediately above says p132. Likely `132`.
- [ ] **P2.** [L200](CORRECTIONS_COVER_LETTER.md#L200) — "section 5.1 (**starting on page 128**)".
  §5.1 starts on p129. (Chapter 5 itself starts p127, so "Chapter 5 introduction (page 128)" at
  [L34](CORRECTIONS_COVER_LETTER.md#L34) is fine.) Likely `129`.
- [ ] **P3.** [L234](CORRECTIONS_COVER_LETTER.md#L234) — "(**page 144**)" for the gymnasium
  non-monotonicity paragraph. §5.4.3 starts p149 and Figure 5.4 is p150, so likely `149` or `150`.
  Note [L233](CORRECTIONS_COVER_LETTER.md#L233) already says p149 for closely related content.
- [ ] **P4.** [L252](CORRECTIONS_COVER_LETTER.md#L252) — "3rd paragraph of section, **also page 178**"
  for §6.4.3, which starts p185 (p178 is §6.2.3, complexity). The bullet above correctly says p185.
  Likely `186`.

Two notes for the pass:

- **Page numbers inside the quoted comments are the examiner's old submission pages and must not be
  changed** — e.g. "Fig 5.7 on page 138" at [L247](CORRECTIONS_COVER_LETTER.md#L247), and the
  `P2:`/`P12:`/`P148:` prefixes throughout. Only pages in *your responses* refer to the new build.
- **V1 was exactly this class of error**: p148 was the examiner's old page echoed into the response.
  Worth watching for others where a response page happens to equal the quote's page.

---

## Group W — Wording, consistency and formatting

**All folded in during the Format C reformat**, since each sat in a sentence that was being
rewritten anyway. Recorded individually so nothing is lost.

- [x] **W0.** First entry — "**pages 66** - in the introductory discussion Chapter 4"
  - Plural "pages" for a single page, and a missing preposition.
  - Applied: `p. 66 | Reference in the introductory discussion of Chapter 4`

- [x] **W1.** P12 — "Added **an** couple sentences" → `Added a couple of sentences`

- [x] **W2.** P2 — "to outline the scope of the thesis, being more specific about **scope of the
  thesis** upfront" repeated itself and dropped an article.
  - Applied: `A new Section 1.2 (p. 4) sets out the scope of the thesis up front, stating that:`

- [x] **W3.** P3 — "why linear utility is assumed **assumption is made**" (two phrasings collided)
  - Applied: `why a linear utility is assumed`

- [x] **W4.** P59 — the garbled one, two sentences spliced together:
  "…which more clearly show this failure mode of UCT **without artificially limiting UCT converges
  in practise to a suboptimal solution in some environments**"
  - Applied: `Paragraph pointing to the DeterministicGridWorld results, which show the failure mode
    without artificially limiting the number of trials: UCT converges in practice to a suboptimal
    solution in some environments`

- [x] **W5.** P132 — "is used to  being clear that" (double space, wrong form)
  - Applied: rewritten as `Because the algorithms are run during the planning phase of the unknown
    weights scenario, metrics computed at the initial state are the relevant ones`

- [x] **W6.** P134 — "There are **a** two reasons" → `There are two reasons`

- [x] **W7.** P134 — "a set of vectors **that sample averages** that may vary" (missing words)
  - Applied: `a set of vectors that are sample averages, which may vary over the algorithm's runtime`

- [x] **W8.** BayesOpt — "I **wont** list" → rewritten, the contraction is gone

- [x] **W9.** British English / consistency sweep — all four verified clean afterwards:
  - **"practise" as a noun** (three instances) → `practice`. British English uses "practice" for the
    noun, "practise" for the verb; the thesis itself was already correct. `grep` now returns none.
  - **`Fig` vs `Figure`** → the one instance in a *response* is now "Figure". The three remaining
    are inside the examiner's quoted comments and were **deliberately left**, since the quotes must
    be reproduced as written.
  - **lowercase "equation 6.25"** → `Equation 6.25`. `grep` for lowercase `equation [0-9]` returns none.
  - **`its` for "it is"** → the offending line was rewritten. The two remaining `its` ("its
    behaviour", "its own") are correct possessives.
  - Also normalised throughout: `page N` → `p. N`, 75 instances.

- [x] **W10.** Tense and voice drift — resolved by the reformat
  - Change descriptions are now impersonal, inside the tables. First person survives in exactly five
    places, all of them where Michael is *answering* a question or conceding a point: the
    planning/RL distinction (P17), the concession on maximum entropy inverse RL (P56), the two
    Appendix D apologies (P208, cross-refs), and the agreement on "hyper-parameter" (BayesOpt).
  - Verified: zero first-person openings in change descriptions. That is the right split, and it is
    now deliberate rather than accidental.

- [x] **W11.** CH5b — redundant sentence
  - The entry said the switch "is addressed in correction P2", then repeated "hopefully this is
    addressed by the changes discussed in the correction for P2". Second sentence dropped, and the
    entry now says what Sections 5.1.1 and 5.1.2 each do instead.

- [x] **W12.** Cross-references — claim upgraded from belief to verified fact
  - Was "I believe that these were all in Appendix D … I have cleaned up Appendix D".
  - Applied: `These were all in Appendix D … the thesis now builds with no undefined references or
    citations, so no "??" remain anywhere.` This is exactly what the examiner asked to be checked,
    and the full build confirms it, so it is worth stating plainly.

---

## Group F — Format (chosen: C)

**Michael chose Format C, and it has been applied to all 25 entries** — 17 location tables, with
short entries as a bold location line plus a sentence.

One refinement Michael made during the reformat, now applied throughout: **where an entry contains
changes of different kinds, split them into separate tables, each with its own lead sentence**,
rather than one monolithic table. He did this first on the opening entry (separating "instances
spelled out" from "references added"), and it was carried into P3 and CH5a. Changes of different
kinds read much better separated, even within a single correction.

The original options are kept below for reference.

### Original options (for reference)

The letter currently mixes three shapes: bare prose ([L58](CORRECTIONS_COVER_LETTER.md#L58)), a flat
bullet list ([L10](CORRECTIONS_COVER_LETTER.md#L10)), and prose-plus-nested-bullets
([L42](CORRECTIONS_COVER_LETTER.md#L42)). All three are fine individually; the inconsistency is what
makes it hard to scan.

Since the stated purpose is **pointing the examiner at locations**, locations should be the most
scannable element on the page. Three options, same content each time:

### Format A — locations first, in bold

```markdown
> P39: discuss implications of assuming linear scalarisation

**Section 2.6.2 (p. 52); forward reference added on p. 46.**

Added a subsection discussing the implications of the assumption explicitly, and a
forward reference to it where linear scalarisation is first defined.
```

*Good: the examiner sees where to look before reading anything. Compact for short entries.*
*Less good: long location lists become an unreadable bold run-on.*

### Format B — explanation first, locations last in italics

```markdown
> P39: discuss implications of assuming linear scalarisation

Added a subsection discussing the implications of the assumption explicitly, and a
forward reference to it where linear scalarisation is first defined.

*Changes: Section 2.6.2 (p. 52); Section 2.6 (p. 46).*
```

*Good: reads as prose, locations still visually distinct.*
*Less good: the examiner has to read to the end to find the pointer.*

### Format C — table for multi-location entries (recommended, hybrid)

Use **Format A** for entries with one or two locations, and a table wherever there are three or more:

```markdown
> P15: In a finite-horizon MDP, the policy needs to condition on the timestep
> (as do the value functions defined later).

Policies now condition on the timestep throughout Chapter 2, up to the point at which
the parameter is explicitly dropped.

| Location | Change |
|---|---|
| Definition 2.2.5 (p. 19) | Policy now conditions on the timestep; notation updated |
| Definition 2.2.6 (p. 20) | Trajectory definition |
| Equation 2.32 (p. 24) | Shannon entropy |
| Definition 2.3.5 / Eq. 2.33 (p. 24–25) | Soft value |
| Definition 2.3.8 / Eq. 2.39 (p. 26) | Optimal soft policy |
| Definition 2.6.2 (p. 45) | Multi-objective trajectory |
| Equation 2.85 (p. 52) | Extracting a policy from CHVI |
| Assumption 2.4.1 (p. 29) | States why the timestep is dropped thereafter |
```

*Good: by far the fastest to look things up in, which is the whole point of the document. Separates
"where" from "what" so neither has to carry the other.*
*Less good: more markup to maintain, and tables render wide if the "Change" column is verbose.*

**Recommendation: Format C.** Nine of the 25 entries have three or more locations, and those are
exactly the ones that are currently hardest to use. The remaining short entries stay as one bold
line plus a sentence, which keeps the document from feeling over-engineered.

---

## Verified as substantiated

Spot-checked that the claimed change actually exists in the thesis for every entry. All present. In
particular:

- `\mccorrect{only}` in the Markov assumption (P13) — present, ch2 §2.2.
- Simple-regret bound explanation (P12) — present, end of §2.1.2.
- §2.3.2 "Planning Versus Reinforcement Learning" (P17) — present, p26, and the section headings were
  renamed as described.
- Definition 2.3.4 + Assumption 2.3.1 (P18) — present, p23, and the ch4 assumption list carries the
  matching note.
- §2.6.2 (P39) — present, p52. §3.5.1 (C5a) — present, p63. Theorem 5.5.1 (P3) — present, p162.
- Corollary 4.5.1 proof and Figure 4.18 (P208) — present, p112.
- Figure 4.3 is the correct number for the gridworld results caption (P59) — the earlier draft said
  4.2, which was the wrong figure.
- No `hyperparameter`/`hyper-parameter` remains anywhere in the body text (BayesOpt entry).
