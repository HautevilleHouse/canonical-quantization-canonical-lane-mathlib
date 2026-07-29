import CanonicalQuantizationCanonicalLaneLean.QuantizationMap
import Mathlib.Algebra.Operator.Weyl

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure WeylCCRAalgebra where
  generators : Type u
  commutationRelation : Prop
  exponentiatedForm : Prop
  regularityCondition : Prop

structure WeylCCREvidence (W : WeylCCRAalgebra) where
  commutationRelationClosed : W.commutationRelation
  exponentiatedFormClosed : W.exponentiatedForm
  regularityConditionClosed : W.regularityCondition

def WeylCCRClosed (W : WeylCCRAalgebra) : Prop :=
  W.commutationRelation ∧ W.exponentiatedForm ∧ W.regularityCondition

theorem weylCCR_closed_from_evidence (W : WeylCCRAalgebra) (E : WeylCCREvidence W) :
    WeylCCRClosed W := by
  exact And.intro E.commutationRelationClosed (And.intro E.exponentiatedFormClosed E.regularityConditionClosed)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse
