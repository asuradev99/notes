# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a collection of LaTeX physics notes organized by subject. Each subject lives in its own directory under `/home/aditya/Documents/Notes/` and follows an identical structure:

- `main.tex` — the single source file for the notes
- `img/` — images referenced in the document
- `main.pdf` — compiled output (not tracked in git)
- Auxiliary build artifacts (`*.aux`, `*.log`, `*.toc`, `*.fls`, `*.fdb_latexmk`, `*.synctex.gz`, `*.out`, `*.bbl`) — not tracked in git

Current subject directories: `thermo-stat-mech/`, `class-mech/`, `electro/`, `methods/`, `waves/`

## Build Commands

Compile a subject's notes to PDF (run from within the subject directory):
```bash
latexmk -pdf main.tex
```

Compile once without latexmk:
```bash
pdflatex main.tex
```

Clean build artifacts:
```bash
latexmk -c
```

## Document Structure

Each `main.tex` is a self-contained `\documentclass{book}` with chapters and sections. The preamble defines custom theorem/definition/formula/fact environments (styled with `tcolorbox`) and custom commands for vectors (`\vect`, `\svect`, `\uvect`), unit vectors (`\ihat`, `\jhat`, `\khat`, `\rhat`, `\tthat`), and `\defeq` for definitional equality.

The `physics` package is loaded, providing `\dd`, `\pdv`, `\dv`, `\grad`, `\curl`, `\div`, `\laplacian`, `\bra`, `\ket`, etc.
