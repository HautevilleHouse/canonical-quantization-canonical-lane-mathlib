import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure HilbertSpace where
  carrier : Type u
  inner : carrier → carrier → ℂ
  completeness : Prop
  innerProduct : ∀ x y, inner x y = conj (inner y x)
  positivity : ∀ x, inner x x ≥ 0 ∧ (inner x x = 0 ↔ x = 0)

structure ClassicalObservable where
  phaseSpace : Type u
  poissonBracket : phaseSpace → phaseSpace → ℝ
  smoothFunctions : Type v

structure QuantizationMap (H : HilbertSpace) (C : ClassicalObservable) where
  quantize : (C.smoothFunctions → ℂ) → (H.carrier → H.carrier)
  preserveCommutation : Prop
  containIdentity : Prop

structure QuantizationPackage (H : HilbertSpace) (C : ClassicalObservable) where
  map : QuantizationMap H C
  hilbertEvidence : H.completeness
  classicalEvidence : C.poissonBracket ≠ ∅

def QuantizationPackageClosed {H : HilbertSpace} {C : ClassicalObservable} (Q : QuantizationPackage H C) : Prop :=
  Q.map.preserveCommutation ∧ Q.map.containIdentity ∧ Q.hilbertEvidence

theorem quantization_package_closed {H : HilbertSpace} {C : ClassicalObservable} (Q : QuantizationPackage H C) : QuantizationPackageClosed Q :=
  And.intro Q.map.preserveCommutation (And.intro Q.map.containIdentity Q.hilbertEvidence)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse