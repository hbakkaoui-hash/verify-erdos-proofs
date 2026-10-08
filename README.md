# Independent verification of two pinned Lean proofs

This repository contains a single GitHub Actions workflow. It checks out
[plby/lean-proofs](https://github.com/plby/lean-proofs) at the pinned commit
`8822f7ddef30fadbd92e1c6ab4ed897af356af5e`, builds two modules against Lean
v4.33.0 and Mathlib, and prints the axiom closure of the two theorems:

| theorem | linked from |
|---|---|
| `Erdos446.erdos_446` | [formal-conjectures#6429](https://github.com/google-deepmind/formal-conjectures/pull/6429) |
| `Erdos449.not_erdos_449` | [formal-conjectures#5210](https://github.com/google-deepmind/formal-conjectures/pull/5210) |

Nothing is modified in the upstream repository: the workflow only reads the
pinned commit. The expected output of each axiom step is

```
depends on axioms: [propext, Classical.choice, Quot.sound]
```

which is the axiom set permitted by the Comparator configuration shipped with
each challenge (`src/latest/ComparatorChallenges/ErdosProblems/Erdos44*.json`).

This is **not** a Comparator run: it establishes that the proofs compile with
no `sorry` and no unusual axiom, not that their statements coincide with the
ones in formal-conjectures.
