import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure SoilConsolidationPackage where
  hydraulicConductivity : ℝ
  compressibility : ℝ
  voidRatio : ℝ
  consolidationEquation : Prop
  timeDependentSettlement : Prop
  porePressureDissipation : Prop

structure SoilConsolidationEvidence (C : SoilConsolidationPackage) where
  consolidationEquationClosed : C.consolidationEquation
  timeDependentSettlementClosed : C.timeDependentSettlement
  porePressureDissipationClosed : C.porePressureDissipation

def SoilConsolidationClosed (C : SoilConsolidationPackage) : Prop :=
  C.consolidationEquation ∧ C.timeDependentSettlement ∧ C.porePressureDissipation

theorem soil_consolidation_closed_from_evidence (C : SoilConsolidationPackage)
    (E : SoilConsolidationEvidence C) : SoilConsolidationClosed C := by
  exact And.intro E.consolidationEquationClosed
    (And.intro E.timeDependentSettlementClosed E.porePressureDissipationClosed)

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse
