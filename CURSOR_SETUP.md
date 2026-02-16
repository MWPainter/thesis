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

## 6. (Optional) Global Cursor user settings for UK spellcheck

In **Cursor** → File → Preferences → Settings (or edit `~/.config/Cursor/User/settings.json` on Linux), add:

```json
"cSpell.language": "en-GB",
"cSpell.enabled": true
```

This makes UK English the default in all projects; the thesis workspace still uses its own `cSpell.*` and `flagWords`.

---

## Checklist (replicate on desktop)

- [ ] Run the `apt-get` commands (step 1).
- [ ] In `ociamthesis.cls`, change babel to `[greek,english]` (step 2).
- [ ] Install the three extensions (step 3).
- [ ] Add `.vscode/settings.json` (step 4).
- [ ] Add `.vscode/extensions.json` (step 5).
- [ ] Optionally set user-level `cSpell.language` and `cSpell.enabled` (step 6).

After that: open the thesis folder in Cursor, open `Oxford_Thesis.tex`, save to build, and view the PDF in the tab. American spellings in the list will be flagged with British suggestions.
