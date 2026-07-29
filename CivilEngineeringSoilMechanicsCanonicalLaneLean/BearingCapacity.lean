import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure BearingCapacityPackage where
  ultimateBearingCapacity : ℝ
  allowableBearingCapacity : ℝ
  terzaghiBearingCapacityFormula : Prop
  meyerhofBearingCapacityFormula : Prop
  shapeFactors : Prop
  depthFactors : Prop
  inclinationFactors : Prop

structure BearingCapacityEvidence (B : BearingCapacityPackage) where
  terzaghiBearingCapacityFormulaClosed : B.terzaghiBearingCapacityFormula
  meyerhofBearingCapacityFormulaClosed : B.meyerhofBearingCapacityFormula
  shapeFactorsClosed : B.shapeFactors
  depthFactorsClosed : B.depthFactors
  inclinationFactorsClosed : B.inclinationFactors

def BearingCapacityClosed (B : BearingCapacityPackage) : Prop :=
  B.terzaghiBearingCapacityFormula ∧ B.meyerhofBearingCapacityFormula ∧
  B.shapeFactors ∧ B.depthFactors ∧ B.inclinationFactors

theorem bearing_capacity_closed_from_evidence (B : BearingCapacityPackage)
    (E : BearingCapacityEvidence B) : BearingCapacityClosed B := by
  exact And.intro E.terzaghiBearingCapacityFormulaClosed
    (And.intro E.meyerhofBearingCapacityFormulaClosed
      (And.intro E.shapeFactorsClosed
        (And.intro E.depthFactorsClosed E.inclinationFactorsClosed)))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse