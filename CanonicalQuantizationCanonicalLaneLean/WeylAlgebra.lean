import HautevilleHouse.CanonicalQuantizationCanonicalLaneLean.CanonicalCommutationRelations

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure WeylAlgebraPackage {C : CCRPackage} where
  algebra : Type
  multiplication : algebra → algebra → algebra
  involution : algebra → algebra
  weylRelations : Prop
  representationTheory : Prop

structure WeylAlgebraEvidence {C : CCRPackage} (W : WeylAlgebraPackage C) where
  weylRelationsClosed : W.weylRelations
  representationTheoryClosed : W.representationTheory

def WeylAlgebraClosed {C : CCRPackage} (W : WeylAlgebraPackage C) : Prop :=
  W.weylRelations ∧ W.representationTheory

theorem weyl_algebra_closed_from_evidence {C : CCRPackage} (W : WeylAlgebraPackage C) (E : WeylAlgebraEvidence W) :
    WeylAlgebraClosed W :=
  And.intro E.weylRelationsClosed E.representationTheoryClosed

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse