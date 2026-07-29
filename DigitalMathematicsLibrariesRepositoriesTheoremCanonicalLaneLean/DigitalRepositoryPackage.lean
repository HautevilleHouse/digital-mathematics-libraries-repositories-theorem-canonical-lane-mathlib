import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalRepositoryPackage where
  baseURL : String
  softwareVersion : String
  metadataSchema : String
  interoperabilityProtocol : String
  citationGraph : String
  objectCount : Nat
  lastUpdate : String

structure DigitalRepositoryEvidence (R : DigitalRepositoryPackage) where
  baseURLValid : R.baseURL ≠ ""
  softwareVersionValid : R.softwareVersion ≠ ""
  metadataSchemaValid : R.metadataSchema ≠ ""
  interoperabilityProtocolValid : R.interoperabilityProtocol ≠ ""
  citationGraphValid : R.citationGraph ≠ ""
  objectCountPositive : R.objectCount > 0

def DigitalRepositoryClosed (R : DigitalRepositoryPackage) : Prop :=
  R.baseURL ≠ "" ∧ R.softwareVersion ≠ "" ∧ R.metadataSchema ≠ "" ∧
  R.interoperabilityProtocol ≠ "" ∧ R.citationGraph ≠ "" ∧ R.objectCount > 0

theorem digital_repository_closed_from_evidence (R : DigitalRepositoryPackage) (E : DigitalRepositoryEvidence R) :
    DigitalRepositoryClosed R := by
  exact And.intro E.baseURLValid (And.intro E.softwareVersionValid (And.intro E.metadataSchemaValid (And.intro E.interoperabilityProtocolValid (And.intro E.citationGraphValid E.objectCountPositive))))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse