import CanonicalQuantizationCanonicalLaneLean.PhaseSpace
import Mathlib.Algebra.CStarAlgebra

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure QuantizationMap (P : PhaseSpace) where
  hilbertSpace : Type u
  observableAlgebra : Type v
  quantization : ∀ (f : P.manifold → ℝ), observableAlgebra
  linearity : Prop
  poissonToCommutator : Prop
  irreducibility : Prop

structure QuantizationMapEvidence {P : PhaseSpace} (Q : QuantizationMap P) where
  linearityClosed : Q.linearity
  poissonToCommutatorClosed : Q.poissonToCommutator
  irreducibilityClosed : Q.irreducibility

def QuantizationMapClosed {P : PhaseSpace} (Q : QuantizationMap P) : Prop :=
  Q.linearity ∧ Q.poissonToCommutator ∧ Q.irreducibility

theorem quantizationMap_closed_from_evidence {P : PhaseSpace} (Q : QuantizationMap P) 
    (E : QuantizationMapEvidence Q) : QuantizationMapClosed Q := by
  exact And.intro E.linearityClosed (And.intro E.poissonToCommutatorClosed E.irreducibilityClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
