/-
Les definitions de la pull request google-deepmind/formal-conjectures#5210,
recopiees telles quelles et renommees pour cohabiter avec celles de la preuve
epinglee dans un meme environnement :

  FC.closePairs / FC.r        <- Erdos449.closePairs / Erdos449.r
                                 (FormalConjectures/ErdosProblems/449.lean)
  Set.partialDensityFC
  Set.HasDensityFC            <- Set.partialDensity / Set.HasDensity
                                 (FormalConjecturesForMathlib/Data/Set/Density.lean)

Ce module est importe a l'identique par le defi et par la solution, de sorte que
les deux enonces portent litteralement sur les memes constantes.
-/
import Mathlib

open Filter
open scoped Topology

namespace Set

@[inline]
noncomputable abbrev partialDensityFC {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (A : Set β := Set.univ) (b : β) : ℝ :=
  ((S ∩ A) ∩ Iio b).ncard / (A ∩ Iio b).ncard

def HasDensityFC {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (α : ℝ) (A : Set β := Set.univ) : Prop :=
  Tendsto (fun (b : β) => S.partialDensityFC A b) atTop (𝓝 α)

end Set

namespace FC

def closePairs (n : ℕ) : Finset (ℕ × ℕ) :=
  (n.divisors ×ˢ n.divisors).filter fun p => p.1 < p.2 ∧ p.2 < 2 * p.1

def r (n : ℕ) : ℕ := (closePairs n).card

end FC
