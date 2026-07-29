import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure ShearStrengthCriteriaPackage where
  cohesionIntercept : ℝ
  frictionAngle : ℝ
  failureEnvelope : Prop
  mohrCoulombCriterion : Prop
  peakStrength : Prop
  residualStrength : Prop

structure ShearStrengthCriteriaEvidence (S : ShearStrengthCriteriaPackage) where
  failureEnvelopeClosed : S.failureEnvelope
  mohrCoulombCriterionClosed : S.mohrCoulombCriterion
  peakStrengthClosed : S.peakStrength
  residualStrengthClosed : S.residualStrength

def ShearStrengthCriteriaClosed (S : ShearStrengthCriteriaPackage) : Prop :=
  S.failureEnvelope ∧ S.mohrCoulombCriterion ∧ S.peakStrength ∧ S.residualStrength

theorem shear_strength_criteria_closed_from_evidence (S : ShearStrengthCriteriaPackage)
    (E : ShearStrengthCriteriaEvidence S) : ShearStrengthCriteriaClosed S := by
  exact And.intro E.failureEnvelopeClosed
    (And.intro E.mohrCoulombCriterionClosed
      (And.intro E.peakStrengthClosed E.residualStrengthClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse