import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure UncertaintyPrinciple (A : CCRAlgebra V) where
  positionOperator : V → A.carrier
  momentumOperator : V → A.carrier
  commutatorBound : ∀ x y : V, ∥positionOperator x * momentumOperator y - momentumOperator y * positionOperator x∥ ≥ |ω x y| / 2

structure UncertaintyPrincipleEvidence (U : UncertaintyPrinciple A) where
  positionClosed : U.positionOperator
  momentumClosed : U.momentumOperator
  commutatorBoundClosed : U.commutatorBound

def UncertaintyPrincipleClosed (U : UncertaintyPrinciple A) : Prop :=
  U.positionOperator ∧ U.momentumOperator ∧ U.commutatorBound

theorem uncertainty_principle_closed_from_evidence (U : UncertaintyPrinciple A) (E : UncertaintyPrincipleEvidence U) : UncertaintyPrincipleClosed U :=
  And.intro E.positionClosed (And.intro E.momentumClosed E.commutatorBoundClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
