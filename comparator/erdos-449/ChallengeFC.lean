/-
Le defi : la conclusion de `erdos_449` telle qu'elle figure dans la pull request
google-deepmind/formal-conjectures#5210, sur les definitions de cette PR.
-/
import FCDefs

namespace FC

theorem erdos_449 : ¬
    ∀ ε : ℝ, 0 < ε →
      Set.HasDensityFC {n : ℕ | (r n : ℝ) < ε * (n.divisors.card : ℝ)} 1 := by
  sorry

end FC
