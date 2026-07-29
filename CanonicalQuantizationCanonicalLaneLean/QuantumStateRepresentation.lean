import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure HilbertSpacePackage (C : CCRPackage) where
  hilbertSpace : Type u
  innerProduct : Type v
  denseDomain : Prop
  selfAdjointOperators : Prop
  spectralDecomposition : Prop
  bornRule : Prop

structure HilbertSpaceEvidence {C : CCRPackage} (H : HilbertSpacePackage C) where
  denseDomainClosed : H.denseDomain
  selfAdjointOperatorsClosed : H.selfAdjointOperators
  spectralDecompositionClosed : H.spectralDecomposition
  bornRuleClosed : H.bornRule

def HilbertSpaceClosed {C : CCRPackage} (H : HilbertSpacePackage C) : Prop :=
  H.denseDomain ∧ H.selfAdjointOperators ∧ H.spectralDecomposition ∧ H.bornRule

theorem hilbert_space_closed_from_evidence {C : CCRPackage} (H : HilbertSpacePackage C) (E : HilbertSpaceEvidence H) :
    HilbertSpaceClosed H := by
  exact And.intro E.denseDomainClosed (And.intro E.selfAdjointOperatorsClosed (And.intro E.spectralDecompositionClosed E.bornRuleClosed))

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse