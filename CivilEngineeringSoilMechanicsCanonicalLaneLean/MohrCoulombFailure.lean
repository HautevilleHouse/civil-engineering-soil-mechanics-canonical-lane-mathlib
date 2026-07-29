import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure MohrCoulombFailurePackage where
  cohesion : ℝ
  frictionAngle : ℝ
  normalStress : ℝ
  shearStrength : Prop
  failureCriterion : Prop
  mohrCircle : Prop
  failureEnvelope : Prop

structure MohrCoulombFailureEvidence (M : MohrCoulombFailurePackage) where
  shearStrengthClosed : M.shearStrength
  failureCriterionClosed : M.failureCriterion
  mohrCircleClosed : M.mohrCircle
  failureEnvelopeClosed : M.failureEnvelope

def MohrCoulombFailureClosed (M : MohrCoulombFailurePackage) : Prop :=
  M.shearStrength ∧ M.failureCriterion ∧ M.mohrCircle ∧ M.failureEnvelope

theorem mohr_coulomb_failure_closed_from_evidence (M : MohrCoulombFailurePackage)
    (E : MohrCoulombFailureEvidence M) : MohrCoulombFailureClosed M := by
  exact And.intro E.shearStrengthClosed
    (And.intro E.failureCriterionClosed
      (And.intro E.mohrCircleClosed E.failureEnvelopeClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
