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

All subjects share the same `\documentclass[openany,oneside]{book}` preamble pattern with:

- **`oneside,openany`** so every subject uses symmetric left/right margins and lets chapters start on any page — do not drop these options or the pages revert to alternating (mirrored) margins.
- **Custom environments** (via `tcolorbox` + `thmtools`): `theorem`, `definition`, `formula`, `fact`, `example`
- **Custom vector commands**: `\vect{}` (arrow bold), `\svect{}` (small arrow bold), `\uvect{}` (hat bold), unit vectors `\ihat`, `\jhat`, `\khat`, `\rhat`, `\tthat`
- **`\defeq`** for definitional equality (`:=`)
- **`physics` package** providing `\dd`, `\pdv`, `\dv`, `\grad`, `\curl`, `\div`, `\laplacian`, `\bra`, `\ket`, etc.
- **Shared chapter/section spacing and list spacing** via `titlesec` (`\titleformat{\chapter}`, `\titlespacing*` for chapter/section/subsection/subsubsection) and `enumitem` (`\setlist{noitemsep, topsep=4pt, parsep=2pt}`)

`thermo-stat-mech` additionally defines `\dbar` (inexact differential). `thermo-stat-mech`, `class-mech`, and `waves` load `tikz`/`pgfplots` for diagrams/plots; `electro` loads `tikz`/`circuitikz` for circuit diagrams instead. `methods` doesn't currently need `tikz` at all. These package choices are content-driven and intentionally differ per subject — only the shared formatting layer above should stay identical across all five.

## Chapter File Organization

Content is split across files differently per subject:

- **`thermo-stat-mech/`**: `main.tex` inputs `ch1.tex` through `ch7.tex`
- **`electro/`**: `main.tex` inputs `ch_em1.tex` through `ch_em10.tex`
- **`class-mech/`**: `main.tex` contains the first two chapters inline, then inputs `ch4.tex` through `ch13.tex`

## Theorem Numbering

- `thermo-stat-mech`, `electro`, and `waves`: environments numbered `within=section`
- `class-mech` and `methods`: environments numbered `within=chapter`
