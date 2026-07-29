import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure HilbertSpacePackage where
  space : Type u
  innerProduct : Type v
  separable : Prop
  complete : Prop
  denseSubspace : Prop
  
structure HilbertSpaceEvidence (H : HilbertSpacePackage) where
  separableClosed : H.separable
  completeClosed : H.complete
  denseSubspaceClosed : H.denseSubspace

def HilbertSpaceClosed (H : HilbertSpacePackage) : Prop :=
  H.separable ∧ H.complete ∧ H.denseSubspace

theorem hilbert_space_closed_from_evidence
    (H : HilbertSpacePackage) (E : HilbertSpaceEvidence H) :
    HilbertSpaceClosed H := by
  exact And.intro E.separableClosed
    (And.intro E.completeClosed E.denseSubspaceClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse