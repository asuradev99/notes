# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A collection of LaTeX physics notes organized by subject. Each subject lives in its own directory and compiles to a single PDF via `main.tex`.

Subject directories: `thermo-stat-mech/`, `class-mech/`, `electro/`, `methods/`, `waves/`, `solid-state/`, `circuits/`

## Build Commands

Run from within the subject directory:

```bash
latexmk -pdf main.tex   # compile to PDF (output name set by .latexmkrc)
latexmk -c              # clean build artifacts
pdflatex main.tex       # single-pass compile (outputs main.pdf)
```

Each directory has a `.latexmkrc` that sets `$jobname` for a descriptive PDF name:
- `thermo-stat-mech/` → `thermodynamics-and-statistical-mechanics.pdf`
- `class-mech/` → `classical-mechanics.pdf`
- `electro/` → `electromagnetism.pdf`
- `methods/` → `mathematical-methods.pdf`
- `waves/` → `waves-and-optics.pdf`
- `solid-state/` → `solid-state-physics.pdf`
- `circuits/` → `circuits.pdf`

## Document Structure

`shared/preamble.tex` is the single source of truth for formatting shared across all subjects: all common packages, colors, the `theorem`/`definition`/`formula`/`fact`/`example` environments (via `tcolorbox` + `thmtools`, all numbered `within=section`, all breakable across pages), chapter/section spacing (`titlesec`), list spacing (`enumitem`'s `\setlist{noitemsep, topsep=4pt, parsep=2pt}`), `\geometry{...}`, `\raggedbottom`/`\allowdisplaybreaks`, and the custom commands (`\vect`, `\svect`, `\uvect`, unit vectors `\ihat`/`\jhat`/`\khat`/`\rhat`/`\tthat`, `\defeq`).

**Vector notation:** every subject uses two macros side by side, chosen per symbol to match the conventional case of that physical quantity rather than uppercasing everything. `\vect{#1}`/`\svect{#1}` render their argument bold **and uppercased** (e.g. `\vect{E}` → bold **E**, `\vect{r}` → bold **R**), for vectors whose conventional symbol is a capital — fields (`\vect{E}`, `\vect{B}`, `\vect{D}`), forces (`\vect{F}`), current density (`\vect{J}`), a system's total momentum `\vect{P}` or a center-of-mass position `\vect{R}` as distinct from a single particle's `\vect{p}`/`\vect{r}`, angular momentum `\vect{L}`, vector potential `\vect{A}`, the Poynting vector `\vect{S}`. `\lvect{#1}` renders bold with **no case change**, for vectors conventionally written lowercase — position `\lvect{r}`/`\lvect{x}`, velocity `\lvect{v}`, momentum `\lvect{p}`, acceleration `\lvect{a}`, wavevectors `\lvect{k}`, area-element and line-element vectors `\lvect{a}`/`\lvect{s}`, per-particle forces `\lvect{f}` as distinct from a system's `\vect{F}`. Both are defined in `shared/preamble.tex`; `\vect`'s uppercasing is implemented via `\MakeUppercase`, which only touches literal single-character tokens, so it leaves Greek letters (`\omega`, `\tau`, `\theta`, ...) and control sequences (`\Delta`, `\ddot{}`, `\ell`, ...) unchanged — only bare Latin letters in the argument get capitalized; watch for this on arguments with a letter subscript (`\vect{F_{ab}}`), where the subscript letters get capitalized too unless the whole thing is wrapped in `\lvect` instead. `\uvect` (unit vectors) keeps its own lowercase hat notation regardless and is unaffected by either. Picking the right macro per symbol matters beyond style: several subjects deliberately use the same letter in both cases for related-but-distinct quantities (`\vect{R}` vs `\lvect{r}`, `\vect{P}` vs `\lvect{p}`, `\vect{F}` vs `\lvect{f}`, `\vect{A}` vs `\lvect{a}`), and running everything through `\vect` would render both identically.

**Solid-state vector notation:** `solid-state/` additionally uses `\cvect{#1}` in place of `\vect{#1}` for its capital vectors — lattice vectors `\cvect{R}`/`\cvect{G}`, fields, forces — rendering them **upright** bold rather than italic bold, to visually set them apart from reciprocal-space and position vectors in a subject where the italic/upright distinction carries meaning throughout. Its `\lvect{#1}` is the same macro used everywhere else.

Every subject's `main.tex` starts with:

```latex
\documentclass[openany,oneside]{book}
\input{../shared/preamble}
```

followed by whatever packages/commands that subject alone needs, then `\begin{document}`. `\documentclass` is declared individually in each `main.tex` (it must come first in the compiled file, and this keeps every subject's top line self-explanatory) — **never redefine the shared environments/commands directly in a subject's `main.tex`**, edit `shared/preamble.tex` instead so the change propagates everywhere. In particular, don't drop `oneside,openany` from any subject's `\documentclass`: `book` defaults to `twoside`, which mirrors margins between odd/even pages (alternating left/right margins) — that's why this option is there.

Per-subject additions (content-driven, intentionally differ):
- `thermo-stat-mech`, `class-mech`, `waves`: load `tikz`/`pgfplots` for diagrams/plots.
- `electro`: loads `tikz` for field and geometry diagrams.
- `circuits`: loads `tikz`/`circuitikz` for circuit schematics.
- `methods`: needs no extra packages beyond the shared preamble.
- `solid-state`: loads `tikz`/`pgfplots` for lattice diagrams and band structures.
- `thermo-stat-mech` additionally defines `\dbar` (inexact differential).

## Chapter File Organization

Content is split across files differently per subject:

- **`thermo-stat-mech/`**: `main.tex` inputs `ch1.tex` through `ch7.tex`
- **`waves/`**: `main.tex` inputs `ch1.tex` through `ch8.tex`
- **`electro/`**: `main.tex` inputs `ch_em1.tex`, `ch_em3.tex`, `ch_em4.tex`, `ch_em5.tex`, `ch_em6.tex`, `ch_em9.tex`, `ch_em10.tex` (the numbering has gaps; `ch_em9.tex` holds three chapters)
- **`circuits/`**: `main.tex` inputs `ch1.tex` (batteries and DC networks) and `ch2.tex` (electronics); split out of `electro/` so the EM notes stay field-theoretic
- **`class-mech/`**: `main.tex` contains the first two chapters inline, then inputs `ch4.tex` through `ch13.tex`
- **`solid-state/`**: `main.tex` inputs `ch1.tex` through `ch5.tex`

## Theorem Numbering

All subjects number `theorem`/`definition`/`formula`/`fact`/`example` `within=section`, set once in `shared/preamble.tex`.
