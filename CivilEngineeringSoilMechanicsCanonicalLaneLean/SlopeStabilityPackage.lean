import CivilEngineeringSoilMechanicsCanonicalLaneLean.BearingCapacityPackage

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SlopeStabilityPackage where
  factorOfSafety : Float
  slipSurfaceModeled : Prop
  shearStrengthParametersApplied : Prop
  drivingForcesCalculated : Prop

structure SlopeStabilityEvidence (S : SlopeStabilityPackage) where
  factorOfSafetyClosed : S.factorOfSafety ≥ 1.0
  slipSurfaceModeledClosed : S.slipSurfaceModeled
  shearStrengthParametersAppliedClosed : S.shearStrengthParametersApplied
  drivingForcesCalculatedClosed : S.drivingForcesCalculated

def SlopeStabilityClosed (S : SlopeStabilityPackage) : Prop :=
  S.factorOfSafety ≥ 1.0 ∧ S.slipSurfaceModeled ∧ S.shearStrengthParametersApplied ∧ S.drivingForcesCalculated

theorem slope_stability_closed_from_evidence (S : SlopeStabilityPackage) (E : SlopeStabilityEvidence S) :
    SlopeStabilityClosed S := by
  exact And.intro E.factorOfSafetyClosed (And.intro E.slipSurfaceModeledClosed (And.intro E.shearStrengthParametersAppliedClosed E.drivingForcesCalculatedClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse