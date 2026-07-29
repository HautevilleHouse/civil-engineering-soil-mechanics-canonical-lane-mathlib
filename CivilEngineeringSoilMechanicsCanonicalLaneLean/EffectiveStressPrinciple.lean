import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure EffectiveStressPackage where
  soilSkeleton : Type u
  poreFluid : Type v
  totalStress : Prop
  effectiveStress : Prop
  poreWaterPressure : Prop
  principleStated : Prop
  mechanicalBehaviorGoverned : Prop

structure EffectiveStressEvidence (T : EffectiveStressPackage) where
  totalStressClosed : T.totalStress
  effectiveStressClosed : T.effectiveStress
  poreWaterPressureClosed : T.poreWaterPressure
  principleStatedClosed : T.principleStated
  mechanicalBehaviorGovernedClosed : T.mechanicalBehaviorGoverned

def EffectiveStressClosed (T : EffectiveStressPackage) : Prop :=
  T.totalStress ∧ T.effectiveStress ∧ T.poreWaterPressure ∧ T.principleStated ∧ T.mechanicalBehaviorGoverned

theorem effective_stress_closed_from_evidence (T : EffectiveStressPackage)
    (E : EffectiveStressEvidence T) : EffectiveStressClosed T := by
  exact And.intro E.totalStressClosed
    (And.intro E.effectiveStressClosed
      (And.intro E.poreWaterPressureClosed
        (And.intro E.principleStatedClosed E.mechanicalBehaviorGovernedClosed)))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
