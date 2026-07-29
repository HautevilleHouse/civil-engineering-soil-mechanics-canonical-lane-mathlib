import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure TerzaghiConsolidationPackage where
  porePressureDissipation : Prop
  compressibility : Prop
  permeability : Prop
  timeFactor : Prop
  consolidationSettlement : Prop
  consolidationEquation : porePressureDissipation → compressibility → permeability → timeFactor → consolidationSettlement
  settlementClosed : consolidationSettlement

structure TerzaghiConsolidationEvidence (T : TerzaghiConsolidationPackage) where
  porePressureDissipationClosed : T.porePressureDissipation
  compressibilityClosed : T.compressibility
  permeabilityClosed : T.permeability
  timeFactorClosed : T.timeFactor
  consolidationSettlementClosed : T.consolidationSettlement
  consolidationEquationClosed : T.consolidationEquation T.porePressureDissipation T.compressibility T.permeability T.timeFactor

def TerzaghiConsolidationClosed (T : TerzaghiConsolidationPackage) : Prop :=
  T.porePressureDissipation ∧ T.compressibility ∧ T.permeability ∧ T.timeFactor ∧ T.consolidationSettlement

theorem terzaghi_consolidation_closed_from_evidence
    (T : TerzaghiConsolidationPackage) (E : TerzaghiConsolidationEvidence T) :
    TerzaghiConsolidationClosed T := by
  exact And.intro E.porePressureDissipationClosed (And.intro E.compressibilityClosed
    (And.intro E.permeabilityClosed (And.intro E.timeFactorClosed E.consolidationSettlementClosed)))

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse