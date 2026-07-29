import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SlopeStabilityPackage (M : MohrCoulombFailurePackage) where
  slopeAngle : Prop
  slopeHeight : Prop
  factorOfSafety : Prop
  infiniteSlopeModel : slopeAngle → slopeHeight → M.cohesion → M.frictionAngle → factorOfSafety
  stabilityClosed : factorOfSafety

structure SlopeStabilityEvidence {M : MohrCoulombFailurePackage} (S : SlopeStabilityPackage M) where
  slopeAngleClosed : S.slopeAngle
  slopeHeightClosed : S.slopeHeight
  factorOfSafetyClosed : S.factorOfSafety
  infiniteSlopeModelClosed : S.infiniteSlopeModel S.slopeAngle S.slopeHeight M.cohesion M.frictionAngle

def SlopeStabilityClosed {M : MohrCoulombFailurePackage} (S : SlopeStabilityPackage M) : Prop :=
  S.slopeAngle ∧ S.slopeHeight ∧ S.factorOfSafety

theorem slope_stability_closed_from_evidence
    {M : MohrCoulombFailurePackage} (S : SlopeStabilityPackage M)
    (E : SlopeStabilityEvidence S) : SlopeStabilityClosed S := by
  exact And.intro E.slopeAngleClosed (And.intro E.slopeHeightClosed E.factorOfSafetyClosed)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse