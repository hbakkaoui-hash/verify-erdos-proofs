/-
Machine-checked statement bridge for google-deepmind/formal-conjectures#5210.

Goal: show that the pinned theorem `Erdos449.not_erdos_449`
(plby/lean-proofs @ 8822f7ddef30fadbd92e1c6ab4ed897af356af5e,
src/latest/ErdosProblems/Erdos449.lean#L361) IS the statement of `erdos_449`
in that pull request, rather than merely resembling it.

The definitions below are copied verbatim from formal-conjectures and renamed
so that they can coexist with the ones already in scope. Each copy is checked
against the one the pinned proof actually uses, by `rfl`.
-/
import ErdosProblems.Erdos449

open Filter
open scoped Topology

namespace Set

/-- Verbatim copy of `Set.partialDensity`
(FormalConjecturesForMathlib/Data/Set/Density.lean, lines 42-44). -/
@[inline]
noncomputable abbrev partialDensityFC {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (A : Set β := Set.univ) (b : β) : ℝ :=
  ((S ∩ A) ∩ Iio b).ncard / (A ∩ Iio b).ncard

/-- Verbatim copy of `Set.HasDensity` (same file, lines 91-93). -/
def HasDensityFC {β : Type*} [Preorder β] [LocallyFiniteOrderBot β]
    (S : Set β) (α : ℝ) (A : Set β := Set.univ) : Prop :=
  Tendsto (fun (b : β) => S.partialDensityFC A b) atTop (𝓝 α)

end Set

namespace FC

/-- Verbatim copy of `Erdos449.closePairs`
(FormalConjectures/ErdosProblems/449.lean in the pull request). -/
def closePairs (n : ℕ) : Finset (ℕ × ℕ) :=
  (n.divisors ×ˢ n.divisors).filter fun p => p.1 < p.2 ∧ p.2 < 2 * p.1

/-- Verbatim copy of `Erdos449.r` (same file). -/
def r (n : ℕ) : ℕ := (closePairs n).card

end FC

-- The copies are the very notions the pinned proof is stated with.
example : @Set.HasDensityFC = @Set.HasDensity := rfl
example : FC.closePairs = Erdos449.closeDivisorPairs := rfl
example : FC.r = Erdos449.r := rfl
example : (fun n : ℕ => n.divisors.card) = Erdos449.tau := rfl

/-- The statement of `erdos_449` as it appears in formal-conjectures#5210
(`answer(False) ↔ P`, i.e. `¬ P`), discharged by the pinned theorem itself.
This type-checks only if the two statements are definitionally equal. -/
theorem fc_erdos_449 :
    ¬ ∀ ε : ℝ, 0 < ε →
      Set.HasDensityFC {n : ℕ | (FC.r n : ℝ) < ε * (n.divisors.card : ℝ)} 1 :=
  Erdos449.not_erdos_449

#print axioms fc_erdos_449
