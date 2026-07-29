import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure PhaseSpacePackage where
  manifold : Type u
  symplecticForm : Type v
  poissonBracket : Type w
  smoothStructure : Prop
  closedNondegenerate : Prop
  integrableSystem : Prop

structure PhaseSpaceEvidence (P : PhaseSpacePackage) where
  smoothStructureClosed : P.smoothStructure
  closedNondegenerateClosed : P.closedNondegenerate
  integrableSystemClosed : P.integrableSystem

def PhaseSpaceClosed (P : PhaseSpacePackage) : Prop :=
  P.smoothStructure ∧ P.closedNondegenerate ∧ P.integrableSystem

theorem phase_space_closed_from_evidence (P : PhaseSpacePackage) (E : PhaseSpaceEvidence P) :
    PhaseSpaceClosed P := by
  exact And.intro E.smoothStructureClosed (And.intro E.closedNondegenerateClosed E.integrableSystemClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse