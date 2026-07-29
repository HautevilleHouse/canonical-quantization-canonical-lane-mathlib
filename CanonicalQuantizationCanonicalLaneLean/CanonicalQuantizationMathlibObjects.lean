import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CanonicalQuantizationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure QuantizedSpace where
  carrier : Type
  innerProduct : Type
  completeness : Prop

structure QuantizedAdmittedObject where
  space : QuantizedSpace
  representation : Prop
  ccrAlgebra : Prop
  conclusion : ccrAlgebra

structure QuantizationEndgameState where
  object : QuantizedAdmittedObject

def QuantizationWitnessClosed (O : QuantizedAdmittedObject) : Prop :=
  O.ccrAlgebra

end CanonicalQuantizationCanonicalLaneLean
end HautevilleHouse