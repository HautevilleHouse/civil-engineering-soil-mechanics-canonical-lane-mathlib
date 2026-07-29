import canoncialLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SoilElement where
  carrier : Type
  density : ℝ
  porosity : ℝ
  saturation : ℝ

def densityRange (e : SoilElement) : Prop :=
  e.density ≥ 1.0 ∧ e.density ≤ 3.0

def porosityRange (e : SoilElement) : Prop :=
  e.porosity ≥ 0.0 ∧ e.porosity ≤ 1.0

def saturationRange (e : SoilElement) : Prop :=
  e.saturation ≥ 0.0 ∧ e.saturation ≤ 1.0

structure SoilAdmittedObject where
  element : SoilElement
  validDensity : densityRange element
  validPorosity : porosityRange element
  validSaturation : saturationRange element
  conclusion : True

def SoilWitnessClosed (O : SoilAdmittedObject) : Prop :=
  O.conclusion

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
