import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure WeylOperators (H : HilbertSpace) where
  W : ℝ → ℝ → (H.carrier → H.carrier)
  unitarity : ∀ p q, IsUnitary (W p q)
  weylRelation : ∀ p q p' q', (W p q) ∘ (W p' q') = exp (ⅈ*(p*q' - q*p')/2) • (W (p+p') (q+q'))

structure CCRRepresentation (H : HilbertSpace) where
  position : ℝ → (H.carrier → H.carrier)
  momentum : ℝ → (H.carrier → H.carrier)
  commutation : ∀ x p, (position x) ∘ (momentum p) - (momentum p) ∘ (position x) = ⅈ • (identity H.carrier)
  selfAdjoint : ∀ x, IsSelfAdjoint (position x) ∧ IsSelfAdjoint (momentum x)

structure CCRRepresentationEvidence (R : CCRRepresentation (H : HilbertSpace)) where
  commutationClosed : ∀ x p, R.commutation x p
  selfAdjointClosed : ∀ x, R.selfAdjoint x

def CCRRepresentationClosed (R : CCRRepresentation (H : HilbertSpace)) : Prop :=
  (∀ x p, R.commutation x p) ∧ (∀ x, R.selfAdjoint x)

theorem ccr_representation_closed (R : CCRRepresentation (H : HilbertSpace)) (E : CCRRepresentationEvidence R) : CCRRepresentationClosed R :=
  And.intro E.commutationClosed E.selfAdjointClosed

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse