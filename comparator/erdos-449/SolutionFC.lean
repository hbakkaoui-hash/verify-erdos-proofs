/-
La solution : le meme enonce, demontre par le seul theoreme epingle
`Erdos449.not_erdos_449` de plby/lean-proofs au commit 8822f7d.

Aucune tactique n'intervient : le terme est accepte tel quel, ce qui n'est
possible que si les deux enonces sont definitionnellement egaux.
-/
import FCDefs
import ErdosProblems.Erdos449

namespace FC

theorem erdos_449 : ¬
    ∀ ε : ℝ, 0 < ε →
      Set.HasDensityFC {n : ℕ | (r n : ℝ) < ε * (n.divisors.card : ℝ)} 1 :=
  Erdos449.not_erdos_449

end FC
