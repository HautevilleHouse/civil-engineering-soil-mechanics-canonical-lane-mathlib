import CivilEngineeringSoilMechanicsCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : SoilMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SoilMechanicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse