import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure ConsolidationTheoryPackage where
  consolidationCoefficient : ℝ
  timeFactor : ℝ
  excessPorePressureDissipation : Prop
  settlementPrediction : Prop
  oneDimensionalModel : Prop
  terzaghiEquation : Prop

structure ConsolidationTheoryEvidence (C : ConsolidationTheoryPackage) where
  excessPorePressureDissipationClosed : C.excessPorePressureDissipation
  settlementPredictionClosed : C.settlementPrediction
  oneDimensionalModelClosed : C.oneDimensionalModel
  terzaghiEquationClosed : C.terzaghiEquation

def ConsolidationTheoryClosed (C : ConsolidationTheoryPackage) : Prop :=
  C.excessPorePressureDissipation ∧ C.settlementPrediction ∧
  C.oneDimensionalModel ∧ C.terzaghiEquation

theorem consolidation_theory_closed_from_evidence (C : ConsolidationTheoryPackage)
    (E : ConsolidationTheoryEvidence C) : ConsolidationTheoryClosed C := by
  exact And.intro E.excessPorePressureDissipationClosed
    (And.intro E.settlementPredictionClosed
      (And.intro E.oneDimensionalModelClosed E.terzaghiEquationClosed))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse