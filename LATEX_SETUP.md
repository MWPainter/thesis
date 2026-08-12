# Replicate thesis + Cursor setup on another machine

Use this on a fresh machine (e.g. desktop) to get LaTeX building in Cursor with UK spellcheck and American spellings flagged.

---

## 1. Install LaTeX (Linux)

```bash
sudo apt-get update
sudo apt-get install -y texlive texlive-latex-extra texlive-science texlive-fonts-recommended texlive-bibtex-extra texlive-fonts-extra
```

- `texlive-fonts-extra`: provides `bbm.sty` (indicator function `\one`). Skip if you remove `\usepackage{bbm}`.
- Optional, for latexmk recipe: `sudo apt-get install -y latexmk`

---

## 2. One-off fix in this repo: babel in `ociamthesis.cls`

In `ociamthesis.cls`, change the babel line so the deprecated `latin` option is removed (required on recent TeX Live):

- **From:** `\usepackage[greek,latin,english]{babel}`
- **To:** `\usepackage[greek,english]{babel}`

---

## 3. Install Cursor/VS Code extensions

Install these (Extensions view or command palette “Install Extensions”):

- **LaTeX Workshop** — `james-yu.latex-workshop`
- **Code Spell Checker** — `streetsidesoftware.code-spell-checker`
- **Code Spell Checker - British English** — `streetsidesoftware.code-spell-checker-british-english`

Or open the thesis folder; if you have `.vscode/extensions.json` with recommendations, accept the prompt to install recommended extensions.

From the terminal (use `cursor` instead of `code` for Cursor — they keep separate extension sets, so install into both if you use both):

```bash
code --install-extension james-yu.latex-workshop
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-british-english
```

Check what's installed with `code --list-extensions | grep -iE "latex|spell"`.

---

## 4. Workspace settings: `.vscode/settings.json`

Create or replace `.vscode/settings.json` in the **thesis repo root** with the following (root file is `Oxford_Thesis.tex`; adjust if yours is different):

```json
{
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.rootFile": "Oxford_Thesis.tex",
  "latex-workshop.latex.outDir": "%DIR%",
  "latex-workshop.latex.recipes": [
    {
      "name": "pdflatex ➞ bibtex ➞ pdflatex × 2",
      "tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
    },
    {
      "name": "latexmk (thesis)",
      "tools": ["latexmk"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "-pdf", "%DOC%"],
      "env": {}
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"],
      "env": {}
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": ["%DOCFILE%"],
      "env": {}
    }
  ],
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.synctex.afterBuild.enabled": true,
  "cSpell.language": "en-GB",
  "cSpell.enabled": true,
  "cSpell.enableFiletypes": ["latex", "plaintext"],
  "cSpell.flagWords": [
    "realize: realise", "realized: realised", "realizes: realises", "realizing: realising",
    "color: colour", "colors: colours", "colored: coloured",
    "behavior: behaviour", "behaviors: behaviours",
    "center: centre", "centers: centres",
    "favor: favour", "favors: favours", "favorable: favourable",
    "honor: honour", "honors: honours", "honorable: honourable",
    "labor: labour", "neighbor: neighbour", "neighbors: neighbours",
    "organize: organise", "organized: organised", "organizes: organises", "organizing: organising",
    "recognize: recognise", "recognized: recognised", "recognizes: recognises", "recognizing: recognising",
    "analyze: analyse", "analyzed: analysed", "analyzes: analyses", "analyzing: analysing",
    "optimize: optimise", "optimized: optimised", "optimizes: optimises", "optimizing: optimising",
    "emphasize: emphasise", "emphasized: emphasised",
    "finalize: finalise", "finalized: finalised",
    "authorize: authorise", "authorized: authorised",
    "characterize: characterise", "characterized: characterised",
    "maximize: maximise", "maximized: maximised", "minimize: minimise", "minimized: minimised",
    "defense: defence", "offense: offence",
    "traveled: travelled", "traveling: travelling",
    "canceled: cancelled", "canceling: cancelling",
    "modeling: modelling", "fulfill: fulfil", "fulfilled: fulfilled",
    "enrollment: enrolment", "installment: instalment"
  ]
}
```

- First recipe (pdflatex + bibtex) works without `latexmk`; use the second if you install latexmk.
- PDF opens in a tab; SyncTeX is on for source ↔ PDF jump.

---

## 5. Extension recommendations: `.vscode/extensions.json`

Create `.vscode/extensions.json` in the thesis root:

```json
{
  "recommendations": [
    "james-yu.latex-workshop",
    "streetsidesoftware.code-spell-checker",
    "streetsidesoftware.code-spell-checker-british-english"
  ]
}
```

---

## 6. (Optional) Global user settings for UK spellcheck

File → Preferences → Settings, or edit the user settings file directly on Linux — `~/.config/Code/User/settings.json` for VS Code, `~/.config/Cursor/User/settings.json` for Cursor — and add:

```json
"cSpell.language": "en-GB",
"cSpell.enabled": true
```

This makes UK English the default in all projects; the thesis workspace still uses its own `cSpell.*` and `flagWords`.

---

## 7. Build and view

1. Open the **thesis folder** (not a single file) in VS Code / Cursor, and open `Oxford_Thesis.tex`.
2. Build, by any of:
   - **Save the file** — `autoBuild.run` is `onSave`, so a save triggers the default (first) recipe.
   - Green ▶ button in the TeX sidebar (the "TeX" icon in the activity bar) → *Build LaTeX project*.
   - Command palette (`Ctrl+Shift+P`) → *LaTeX Workshop: Build with recipe* → pick a recipe.
3. View the PDF: command palette → *LaTeX Workshop: View LaTeX PDF file* (or the magnifier icon in the TeX sidebar). It opens in a tab beside the source.
4. SyncTeX jumps: `Ctrl+Alt+J` from source → PDF; `Ctrl+click` in the PDF → source.

A full clean build of this thesis takes a couple of minutes (260 pages, lots of figures); incremental rebuilds are much faster. Progress shows in the status bar, and the full log is in the *LaTeX Compiler* output panel.

Recipe choice: the first recipe (`pdflatex ➞ bibtex ➞ pdflatex × 2`) always runs all four passes and is the reliable "everything resolves" option. The `latexmk (thesis)` recipe reruns only as many passes as needed, so it is quicker day to day — make it the first entry in `latex-workshop.latex.recipes` if you want it as the save-triggered default.

Sanity check from the terminal, without the editor:

```bash
latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error Oxford_Thesis.tex
```

---

## 8. Troubleshooting

- **`latexmk` refuses to rebuild after an error** — it caches the failure and reports `Nothing to do` / `gave an error in previous invocation`. Clear the state and rerun: `latexmk -C` (or delete `Oxford_Thesis.fdb_latexmk`).
- **`I can't write on file 'text/abbreviations.aux'`** — the output directory has no `text/` subfolder. `\include` writes one `.aux` per included file, mirroring the source layout. This only bites if you build out-of-tree; the settings above use `outDir: %DIR%` (build in place), which avoids it. If you do use `-outdir=DIR`, `mkdir -p DIR/text` first.
- **`bbm.sty not found`** — install `texlive-fonts-extra`, or drop `\usepackage{bbm}` and the `\one` indicator macro.
- **Babel error about the `latin` option** — step 2 wasn't applied to `ociamthesis.cls`.
- **Undefined references / citations** — the log ends with a summary like `Latex failed to resolve 12 reference(s)`. A first build always shows these (the `.aux` files don't exist yet); if they persist after a full four-pass build, the labels genuinely don't exist in the source. Find the culprits with:
  ```bash
  grep -oE "(Reference|Citation) \`[^']+'" Oxford_Thesis.log | sort -u
  ```
  then check each with `grep -r "label{thelabel}" text/`.
- **Popup: `chktex: WARNING -- Compilation of regular expression \[(?!...` failed`** — not your document. TeX Live 2024's global `chktexrc` (`/usr/local/texlive/2024/texmf-dist/chktex/chktexrc`, line 247) has one rule written with PCRE lookaheads but missing the `PCRE:` prefix that the neighbouring rules use; this `chktex` build is `Compiled with POSIX extended regex support`, so that single rule fails to compile and everything else still runs. The popup comes from the **`mathematic.vscode-latex`** extension, which lints on every edit (`latex.linter.enabled` defaults to `true`); LaTeX Workshop's own chktex linter is off by default. Fixes, in order of preference:
  1. `"latex.linter.enabled": false` in `.vscode/settings.json` — already applied here.
  2. Uninstall the redundant extension: `code --uninstall-extension mathematic.vscode-latex` (LaTeX Workshop covers build + preview on its own; Cursor never had this extension, which is why the popup is VS Code-only).
  3. Keep linting but fix the rule — add the `PCRE:` prefix to line 247 of the global `chktexrc` (needs `sudo`, and a `tlmgr update` will revert it), or run chktex with `-g0` to skip the global rc entirely.
- **Build artefacts** — `.aux`, `.log`, `.toc`, `.mtc*`, `.synctex.gz` etc. are regenerated on every build. `LaTeX Workshop: Clean up auxiliary files` removes them.

---

## Checklist (replicate on desktop)

- [x] Run the `apt-get` commands (step 1). *(This machine: TeX Live 2024 in `/usr/local/texlive/2024`, installed directly rather than via apt — `pdflatex`, `bibtex` and `latexmk` all on `PATH`.)*
- [x] In `ociamthesis.cls`, change babel to `[greek,english]` (step 2).
- [x] Install the three extensions (step 3).
- [x] Add `.vscode/settings.json` (step 4).
- [x] Add `.vscode/extensions.json` (step 5).
- [x] Optionally set user-level `cSpell.language` and `cSpell.enabled` (step 6).

After that: open the thesis folder, open `Oxford_Thesis.tex`, save to build, and view the PDF in the tab. American spellings in the list will be flagged with British suggestions.
