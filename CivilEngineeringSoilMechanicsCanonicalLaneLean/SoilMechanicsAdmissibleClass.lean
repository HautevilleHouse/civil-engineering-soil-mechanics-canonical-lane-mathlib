import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SoilAdmittedObject where
  soilType : String
  density : Float
  cohesion : Float
  frictionAngle : Float
  conclusion : density > 0.0 ∧ cohesion ≥ 0.0 ∧ frictionAngle > 0.0

def soilWitnessClosed (O : SoilAdmittedObject) : Prop :=
  O.conclusion

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse