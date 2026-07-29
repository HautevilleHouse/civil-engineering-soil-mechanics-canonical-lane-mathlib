import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SoilStrengthCriteriaPackage where
  cohesion : ℝ
  frictionAngle : ℝ
  totalStressParams : Prop
  effectiveStressParams : Prop
  drainedCondition : Prop
  undrainedCondition : Prop

structure SoilStrengthCriteriaEvidence (S : SoilStrengthCriteriaPackage) where
  totalStressParamsClosed : S.totalStressParams
  effectiveStressParamsClosed : S.effectiveStressParams
  drainedConditionClosed : S.drainedCondition
  undrainedConditionClosed : S.undrainedCondition

def SoilStrengthCriteriaClosed (S : SoilStrengthCriteriaPackage) : Prop :=
  S.totalStressParams ∧ S.effectiveStressParams ∧ S.drainedCondition ∧ S.undrainedCondition

theorem soil_strength_criteria_closed_from_evidence (S : SoilStrengthCriteriaPackage)
    (E : SoilStrengthCriteriaEvidence S) : SoilStrengthCriteriaClosed S := by
  exact And.intro E.totalStressParamsClosed
    (And.intro E.effectiveStressParamsClosed
      (And.intro E.drainedConditionClosed E.undrainedConditionClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse