import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure DarcyFlowPackage where
  hydraulicGradient : Prop
  hydraulicConductivity : Prop
  flowVelocity : Prop
  darcyLaw : hydraulicGradient → hydraulicConductivity → flowVelocity
  groundwaterFlowClosed : flowVelocity

structure DarcyFlowEvidence (D : DarcyFlowPackage) where
  hydraulicGradientClosed : D.hydraulicGradient
  hydraulicConductivityClosed : D.hydraulicConductivity
  flowVelocityClosed : D.flowVelocity
  darcyLawClosed : D.darcyLaw D.hydraulicGradient D.hydraulicConductivity

def DarcyFlowClosed (D : DarcyFlowPackage) : Prop :=
  D.hydraulicGradient ∧ D.hydraulicConductivity ∧ D.flowVelocity

theorem darcy_flow_closed_from_evidence
    (D : DarcyFlowPackage) (E : DarcyFlowEvidence D) : DarcyFlowClosed D := by
  exact And.intro E.hydraulicGradientClosed (And.intro E.hydraulicConductivityClosed E.flowVelocityClosed)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse