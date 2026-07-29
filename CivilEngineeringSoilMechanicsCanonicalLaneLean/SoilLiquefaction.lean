import canoncialLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringSoilMechanicsCanonicalLaneLean.SoilMechanicsObjects

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure LiquefactionPackage where
  cyclicStressRatio : ℝ
  correctedSPT : ℕ
  finesContent : ℝ
  csrThreshold : Prop
  sptThreshold : Prop
  finesAdjustment : Prop

structure LiquefactionEvidence (L : LiquefactionPackage) where
  csrThresholdClosed : L.csrThreshold
  sptThresholdClosed : L.sptThreshold
  finesAdjustmentClosed : L.finesAdjustment

def LiquefactionClosed (L : LiquefactionPackage) : Prop :=
  L.csrThreshold ∧ L.sptThreshold ∧ L.finesAdjustment

theorem liquefaction_closed_from_evidence (L : LiquefactionPackage)
  (E : LiquefactionEvidence L) : LiquefactionClosed L := by
  exact And.intro E.csrThresholdClosed (And.intro E.sptThresholdClosed E.finesAdjustmentClosed)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
