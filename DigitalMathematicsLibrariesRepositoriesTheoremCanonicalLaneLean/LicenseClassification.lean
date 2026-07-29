import canonicalLaneMathlib.AdmissibleClass

/-!
# License Classification Package
-/

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure LicenseClassificationPackage where
  licenseType : Prop
  compatibility : Prop
  attribution : Prop
  derivativeWorks : Prop

structure LicenseClassificationEvidence (L : LicenseClassificationPackage) where
  licenseTypeClosed : L.licenseType
  compatibilityClosed : L.compatibility
  attributionClosed : L.attribution
  derivativeWorksClosed : L.derivativeWorks

def LicenseClassificationClosed (L : LicenseClassificationPackage) : Prop :=
  L.licenseType ∧ L.compatibility ∧ L.attribution ∧ L.derivativeWorks

theorem license_classification_closed_from_evidence
    (L : LicenseClassificationPackage) (E : LicenseClassificationEvidence L) :
    LicenseClassificationClosed L := by
  exact And.intro E.licenseTypeClosed
    (And.intro E.compatibilityClosed
      (And.intro E.attributionClosed E.derivativeWorksClosed))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse
