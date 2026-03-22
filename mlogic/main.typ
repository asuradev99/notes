#import "template.typ": *
#import "theorems.typ": *


// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Mathematical Logic Self Study Notes",
  authors: (
    "Ethan Suresh",
  ),
  date: "Fall 2023",
)

#set heading(numbering: "1.1")


#let theorem = thmbox("theorem", "Theorem", fill: rgb("#e0e0e0"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)


#let definition = thmbox("definition", "Definition", fill: rgb("#f2f2f2"))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)
#show par: set block(spacing: 0.65em)
#set par(
  first-line-indent: 1em,
  justify: true,
)
#set math.equation(numbering: "(1)")

= Background

Logic is the analysis of reasoning. Mathematical logic aims to use the tools 
and conventions of mathematics to study logic. There are various sub-branches 
of logic; *propositional logic* studies connectives like _if, then, or, and_, 
etc. while *first-order logic* has the addition of the $forall$ and $exists$ 
quantifiers. 

The mathematician David Hilbert posed 10 problems for mathematics, several
of which have great relevance to mathematical logic: 

1. *Is arithmetic consistent?* In this case, arithmetic refers to elementary number theory.
2. *Is arithmetic complete?* Can we select axioms such that all true statements are provable?

3. 

