import CivilEngineeringSoilMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SoilMechanicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse