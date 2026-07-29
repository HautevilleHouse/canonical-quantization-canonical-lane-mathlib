import canonicalLaneMathlib.AdmissibleClass
import CanonicalQuantizationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

structure AdmissibleClass where
  object : QuantizationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  QuantizationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse