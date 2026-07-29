import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure CCRAlgebra (V : Type u) [AddCommGroup V] [SymplecticForm V] where
  carrier : Type v
  algebraStructure : Algebra ℝ carrier
  ccrRelation : ∀ x y : V, x • y - y • x = (ω x y) • 1
  representation : V → carrier

structure CCRAlgebraEvidence (A : CCRAlgebra V) where
  algebraStructureClosed : A.algebraStructure
  ccrRelationClosed : A.ccrRelation
  representationClosed : A.representation

def CCRAlgebraClosed (A : CCRAlgebra V) : Prop :=
  A.algebraStructure ∧ A.ccrRelation ∧ A.representation

theorem ccr_algebra_closed_from_evidence (A : CCRAlgebra V) (E : CCRAlgebraEvidence A) : CCRAlgebraClosed A :=
  And.intro E.algebraStructureClosed (And.intro E.ccrRelationClosed E.representationClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
