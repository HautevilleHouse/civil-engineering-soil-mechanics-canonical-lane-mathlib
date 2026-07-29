import canoncialLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringSoilMechanicsCanonicalLaneLean.SoilMechanicsObjects

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SettlementPackage where
  initialVoidRatio : ℝ
  compressionIndex : ℝ
  effectiveStressIncrease : ℝ
  settlementComputed : Prop
  layerThickness : ℝ

def settlementFormula (e0 : ℝ) (Cc : ℝ) (dp : ℝ) (H : ℝ) : ℝ :=
  H * Cc / (1 + e0) * Real.log ((dp + 100) / 100)

structure SettlementEvidence (S : SettlementPackage) where
  settlementComputedClosed : S.settlementComputed

def SettlementClosed (S : SettlementPackage) : Prop :=
  S.settlementComputed

theorem settlement_closed_from_evidence (S : SettlementPackage)
  (E : SettlementEvidence S) : SettlementClosed S := by
  exact E.settlementComputedClosed

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
