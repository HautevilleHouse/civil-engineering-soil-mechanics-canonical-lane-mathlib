import CivilEngineeringSoilMechanicsCanonicalLaneLean.EffectiveStressGate

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure BearingCapacityPackage where
  ultimateCapacity : Float
  allowableCapacity : Float
  factorOfSafety : Float
  bearingEquationVerified : Prop

structure BearingCapacityEvidence (B : BearingCapacityPackage) where
  ultimateCapacityClosed : B.ultimateCapacity > 0.0
  allowableCapacityClosed : B.allowableCapacity > 0.0
  factorOfSafetyClosed : B.factorOfSafety ≥ 1.0
  bearingEquationVerifiedClosed : B.bearingEquationVerified

def BearingCapacityClosed (B : BearingCapacityPackage) : Prop :=
  B.ultimateCapacity > 0.0 ∧ B.allowableCapacity > 0.0 ∧ B.factorOfSafety ≥ 1.0 ∧ B.bearingEquationVerified

theorem bearing_capacity_closed_from_evidence (B : BearingCapacityPackage) (E : BearingCapacityEvidence B) :
    BearingCapacityClosed B := by
  exact And.intro E.ultimateCapacityClosed (And.intro E.allowableCapacityClosed (And.intro E.factorOfSafetyClosed E.bearingEquationVerifiedClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse