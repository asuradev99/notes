# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A collection of LaTeX physics notes organized by subject. Each subject lives in its own directory and compiles to a single PDF via `main.tex`.

Subject directories: `thermo-stat-mech/`, `class-mech/`, `electro/`, `methods/`, `waves/`

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

## Document Structure

`shared/preamble.tex` is the single source of truth for formatting shared across all subjects: `\documentclass[openany,oneside]{book}`, all common packages, colors, the `theorem`/`definition`/`formula`/`fact`/`example` environments (via `tcolorbox` + `thmtools`, all numbered `within=section`), chapter/section spacing (`titlesec`), list spacing (`enumitem`'s `\setlist{noitemsep, topsep=4pt, parsep=2pt}`), `\geometry{...}`, and the custom commands (`\vect`, `\svect`, `\uvect`, unit vectors `\ihat`/`\jhat`/`\khat`/`\rhat`/`\tthat`, `\defeq`).

Every subject's `main.tex` starts with a single line pulling this in:

```latex
\input{../shared/preamble}
```

followed by whatever packages/commands that subject alone needs, then `\begin{document}`. **Never re-add a `\documentclass` or redefine these shared environments/commands directly in a subject's `main.tex`** — edit `shared/preamble.tex` instead so the change propagates everywhere. In particular, don't drop `oneside,openany`: `book` defaults to `twoside`, which mirrors margins between odd/even pages (alternating left/right margins) — that's why this option is there.

Per-subject additions (content-driven, intentionally differ):
- `thermo-stat-mech`, `class-mech`, `waves`: load `tikz`/`pgfplots` for diagrams/plots.
- `electro`: loads `tikz`/`circuitikz` for circuit diagrams instead.
- `methods`: needs no extra packages beyond the shared preamble.
- `thermo-stat-mech` additionally defines `\dbar` (inexact differential).

## Chapter File Organization

Content is split across files differently per subject:

- **`thermo-stat-mech/`**: `main.tex` inputs `ch1.tex` through `ch7.tex`
- **`electro/`**: `main.tex` inputs `ch_em1.tex` through `ch_em10.tex`
- **`class-mech/`**: `main.tex` contains the first two chapters inline, then inputs `ch4.tex` through `ch13.tex`

## Theorem Numbering

All subjects number `theorem`/`definition`/`formula`/`fact`/`example` `within=section`, set once in `shared/preamble.tex`.
