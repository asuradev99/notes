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

All subjects share the same `\documentclass{book}` preamble pattern with:

- **Custom environments** (via `tcolorbox` + `thmtools`): `theorem`, `definition`, `formula`, `fact`, `example`
- **Custom vector commands**: `\vect{}` (arrow bold), `\svect{}` (small arrow bold), `\uvect{}` (hat bold), unit vectors `\ihat`, `\jhat`, `\khat`, `\rhat`, `\tthat`
- **`\defeq`** for definitional equality (`:=`)
- **`physics` package** providing `\dd`, `\pdv`, `\dv`, `\grad`, `\curl`, `\div`, `\laplacian`, `\bra`, `\ket`, etc.

`thermo-stat-mech` additionally defines `\dbar` (inexact differential) and loads `tikz`/`pgfplots` for diagrams.

## Chapter File Organization

Content is split across files differently per subject:

- **`thermo-stat-mech/`**: `main.tex` inputs `ch1.tex` through `ch7.tex`
- **`electro/`**: `main.tex` inputs `ch_em1.tex` through `ch_em10.tex`
- **`class-mech/`**: `main.tex` contains the first two chapters inline, then inputs `ch4.tex` through `ch13.tex`

## Theorem Numbering

- `thermo-stat-mech` and `electro`: environments numbered `within=section`
- `class-mech`: environments numbered `within=chapter`
