import CivilEngineeringSoilMechanicsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SoilMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SoilMechanicsAdmittedObject where
  space : SoilMechanicsSpace
  soilStabilityEstablished : Prop
  bearingCapacitySatisfied : Prop
  settlementWithinLimits : Prop
  conclusion : soilStabilityEstablished ∧ bearingCapacitySatisfied ∧ settlementWithinLimits

structure SoilMechanicsEndgameState where
  object : SoilMechanicsAdmittedObject

def SoilMechanicsWitnessClosed (O : SoilMechanicsAdmittedObject) : Prop :=
  O.soilStabilityEstablished ∧ O.bearingCapacitySatisfied ∧ O.settlementWithinLimits

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse