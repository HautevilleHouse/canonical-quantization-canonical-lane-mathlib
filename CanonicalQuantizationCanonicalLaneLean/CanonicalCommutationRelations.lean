import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure CCRPackage (P : PhaseSpacePackage) where
  observableAlgebra : Type u
  commutator : Type v
  weylRepresentation : Type w
  irreducibility : Prop
  uniqueness : Prop
  correspondencePrinciple : Prop

structure CCREvidence {P : PhaseSpacePackage} (C : CCRPackage P) where
  irreducibilityClosed : C.irreducibility
  uniquenessClosed : C.uniqueness
  correspondencePrincipleClosed : C.correspondencePrinciple

def CCRClosed {P : PhaseSpacePackage} (C : CCRPackage P) : Prop :=
  C.irreducibility ∧ C.uniqueness ∧ C.correspondencePrinciple

theorem ccr_closed_from_evidence {P : PhaseSpacePackage} (C : CCRPackage P) (E : CCREvidence C) :
    CCRClosed C := by
  exact And.intro E.irreducibilityClosed (And.intro E.uniquenessClosed E.correspondencePrincipleClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse