import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

structure UnifiedSoilClassification where
  grainSizeDistribution : Prop
  plasticityIndex : Prop
  liquidLimit : Prop
  organicContent : Prop
  groupSymbol : String

structure SoilClassificationPackage (A : AdmissibleClass) where
  soil : UnifiedSoilClassification
  classificationAdmissible : Prop

structure SoilClassificationEvidence {A : AdmissibleClass} (P : SoilClassificationPackage A) where
  classificationAdmissibleClosed : P.classificationAdmissible

def SoilClassificationClosed {A : AdmissibleClass} (P : SoilClassificationPackage A) : Prop :=
  P.classificationAdmissible

theorem soil_classification_closed_from_evidence {A : AdmissibleClass} (P : SoilClassificationPackage A) (E : SoilClassificationEvidence P) :
    SoilClassificationClosed P := by
  exact E.classificationAdmissibleClosed

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse