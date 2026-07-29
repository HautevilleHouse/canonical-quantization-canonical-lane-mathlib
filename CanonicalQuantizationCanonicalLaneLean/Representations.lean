import HautevilleHouse.CanonicalQuantizationCanonicalLaneLean.WeylAlgebra

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure RepresentationPackage {C : CCRPackage} {W : WeylAlgebraPackage C} where
  hilbertSpace : Type
  innerProduct : hilbertSpace → hilbertSpace → ℂ
  representationAction : W.algebra → (hilbertSpace → hilbertSpace)
  irreducibility : Prop
  uniqueness : Prop

structure RepresentationEvidence {C : CCRPackage} {W : WeylAlgebraPackage C} (R : RepresentationPackage C W) where
  irreducibilityClosed : R.irreducibility
  uniquenessClosed : R.uniqueness

def RepresentationClosed {C : CCRPackage} {W : WeylAlgebraPackage C} (R : RepresentationPackage C W) : Prop :=
  R.irreducibility ∧ R.uniqueness

theorem representation_closed_from_evidence {C : CCRPackage} {W : WeylAlgebraPackage C} (R : RepresentationPackage C W) (E : RepresentationEvidence R) :
    RepresentationClosed R :=
  And.intro E.irreducibilityClosed E.uniquenessClosed

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse