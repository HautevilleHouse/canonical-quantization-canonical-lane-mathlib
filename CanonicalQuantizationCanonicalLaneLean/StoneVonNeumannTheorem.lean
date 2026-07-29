import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure StoneVonNeumannTheorem (V : Type u) [AddCommGroup V] [SymplecticForm V] where
  irreducibleRep : CCRAlgebra V → Prop
  uniqueness : ∀ (π1 π2 : CCRAlgebra V → FockSpace V), irreducibleRep π1 → irreducibleRep π2 → ∃ U : UnitaryEquivalence π1 π2
  unitaryEquivalenceExists : Prop

structure StoneVonNeumannEvidence (S : StoneVonNeumannTheorem V) where
  irreducibleClosed : S.irreducibleRep
  uniquenessClosed : S.uniqueness
  unitaryClosed : S.unitaryEquivalenceExists

def StoneVonNeumannClosed (S : StoneVonNeumannTheorem V) : Prop :=
  S.irreducibleRep ∧ S.uniqueness ∧ S.unitaryEquivalenceExists

theorem stone_von_neumann_closed_from_evidence (S : StoneVonNeumannTheorem V) (E : StoneVonNeumannEvidence S) : StoneVonNeumannClosed S :=
  And.intro E.irreducibleClosed (And.intro E.uniquenessClosed E.unitaryClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
