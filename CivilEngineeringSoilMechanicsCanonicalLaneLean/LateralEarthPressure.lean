import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure LateralEarthPressurePackage where
  atRestCoefficient : ℝ
  activeCoefficient : ℝ
  passiveCoefficient : ℝ
  rankineTheory : Prop
  coulombTheory : Prop
  wallMovementCondition : Prop

structure LateralEarthPressureEvidence (L : LateralEarthPressurePackage) where
  rankineTheoryClosed : L.rankineTheory
  coulombTheoryClosed : L.coulombTheory
  wallMovementConditionClosed : L.wallMovementCondition

def LateralEarthPressureClosed (L : LateralEarthPressurePackage) : Prop :=
  L.rankineTheory ∧ L.coulombTheory ∧ L.wallMovementCondition

theorem lateral_earth_pressure_closed_from_evidence (L : LateralEarthPressurePackage)
    (E : LateralEarthPressureEvidence L) : LateralEarthPressureClosed L := by
  exact And.intro E.rankineTheoryClosed
    (And.intro E.coulombTheoryClosed E.wallMovementConditionClosed)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse