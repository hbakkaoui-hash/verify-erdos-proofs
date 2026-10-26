/-
Le defi : l'enonce de `erdos_449` tel qu'il figure dans la pull request
google-deepmind/formal-conjectures#5210, rendu autonome sur Mathlib seul.

Les definitions sont recopiees telles quelles depuis cette branche :
  - `closePairs` et `r`   : FormalConjectures/ErdosProblems/449.lean
  - `partialDensity` et `HasDensity` : FormalConjecturesForMathlib/Data/Set/Density.lean

Le theoreme porte le nom qu'il a dans la solution, `Erdos449.not_erdos_449`,
pour que `lake comparator` confronte les deux enonces.
-/
import Mathlib

open Filter
open scoped Topology

namespace Set

/-- Recopie de `Set.partialDensity` (FormalConjecturesForMathlib/Data/Set/Density.lean). -/
@[inline]
noncomputable abbrev partialDensity {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (A : Set β := Set.univ) (b : β) : ℝ :=
  ((S ∩ A) ∩ Iio b).ncard / (A ∩ Iio b).ncard

/-- Recopie de `Set.HasDensity` (meme fichier). -/
def HasDensity {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (α : ℝ) (A : Set β := Set.univ) : Prop :=
  Tendsto (fun (b : β) => S.partialDensity A b) atTop (𝓝 α)

end Set

namespace Erdos449

/-- Recopie de `Erdos449.closePairs` (FormalConjectures/ErdosProblems/449.lean). -/
def closePairs (n : ℕ) : Finset (ℕ × ℕ) :=
  (n.divisors ×ˢ n.divisors).filter fun p => p.1 < p.2 ∧ p.2 < 2 * p.1

/-- Recopie de `Erdos449.r` (meme fichier). -/
def r (n : ℕ) : ℕ := (closePairs n).card

/-- La conclusion de `erdos_449` dans la pull request : la reponse est negative,
donc l'enonce retenu est la negation de la question posee. -/
theorem not_erdos_449 : ¬
    ∀ ε : ℝ, 0 < ε →
      {n : ℕ | (r n : ℝ) < ε * (n.divisors.card : ℝ)}.HasDensity 1 := by
  sorry

end Erdos449
