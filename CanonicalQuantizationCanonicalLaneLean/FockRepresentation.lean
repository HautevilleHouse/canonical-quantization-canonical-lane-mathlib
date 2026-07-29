import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure FockSpace (H : Type u) [InnerProductSpace ℂ H] where
  carrier : Type v
  vacuumVector : carrier
  creationAnnihilation : ℕ → carrier → carrier
  ccrRep : CCRAlgebra H

structure FockRepresentation (F : FockSpace H) where
  fockStructureClosed : F.carrier
  vacuumClosed : F.vacuumVector
  creationAnnihilationClosed : F.creationAnnihilation
  ccrRepClosed : F.ccrRep

def FockRepresentationClosed (F : FockSpace H) : Prop :=
  F.carrier ∧ F.vacuumVector ∧ F.creationAnnihilation ∧ F.ccrRep

theorem fock_representation_closed_from_evidence (F : FockSpace H) (E : FockRepresentation F) : FockRepresentationClosed F :=
  And.intro E.fockStructureClosed (And.intro E.vacuumClosed (And.intro E.creationAnnihilationClosed E.ccrRepClosed))

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
