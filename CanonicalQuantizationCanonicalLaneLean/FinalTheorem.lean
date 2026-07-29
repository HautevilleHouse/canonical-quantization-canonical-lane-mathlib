import canonicalLaneMathlib.AdmissibleClass
import CanonicalQuantizationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

def ConstrainedQuantizationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_quantization_endgame (A : AdmissibleClass) :
    ConstrainedQuantizationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse