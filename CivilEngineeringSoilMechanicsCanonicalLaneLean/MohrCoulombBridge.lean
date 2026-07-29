import CivilEngineeringSoilMechanicsCanonicalLaneLean.SoilMechanicsAdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringSoilMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  soilWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringSoilMechanicsCanonicalLaneLean
end HautevilleHouse