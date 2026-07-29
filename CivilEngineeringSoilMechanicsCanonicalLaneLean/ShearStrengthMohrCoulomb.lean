import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure MohrCoulombPackage where
  cohesion : Prop
  frictionAngle : Prop
  normalStress : Prop
  shearStrength : Prop
  failureEnvelope : Prop

structure MohrCoulombEvidence (M : MohrCoulombPackage) where
  cohesionClosed : M.cohesion
  frictionAngleClosed : M.frictionAngle
  normalStressClosed : M.normalStress
  shearStrengthClosed : M.shearStrength
  failureEnvelopeClosed : M.failureEnvelope

def MohrCoulombClosed (M : MohrCoulombPackage) : Prop :=
  M.cohesion ∧ M.frictionAngle ∧ M.normalStress ∧ M.shearStrength ∧ M.failureEnvelope

theorem mohr_coulomb_closed_from_evidence (M : MohrCoulombPackage) (E : MohrCoulombEvidence M) :
    MohrCoulombClosed M := by
  exact And.intro E.cohesionClosed (And.intro E.frictionAngleClosed (And.intro E.normalStressClosed (And.intro E.shearStrengthClosed E.failureEnvelopeClosed)))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse