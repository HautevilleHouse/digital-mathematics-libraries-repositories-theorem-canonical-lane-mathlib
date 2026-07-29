import canonicalLaneMathlib.AdmissibleClass

/-!
# Interoperability Package
-/

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure InteroperabilityPackage where
  dataFormats : Prop
  apiEndpoints : Prop
  metadataStandards : Prop
  crossRepositoryLinking : Prop

structure InteroperabilityEvidence (I : InteroperabilityPackage) where
  dataFormatsClosed : I.dataFormats
  apiEndpointsClosed : I.apiEndpoints
  metadataStandardsClosed : I.metadataStandards
  crossRepositoryLinkingClosed : I.crossRepositoryLinking

def InteroperabilityClosed (I : InteroperabilityPackage) : Prop :=
  I.dataFormats ∧ I.apiEndpoints ∧ I.metadataStandards ∧ I.crossRepositoryLinking

theorem interoperability_closed_from_evidence
    (I : InteroperabilityPackage) (E : InteroperabilityEvidence I) :
    InteroperabilityClosed I := by
  exact And.intro E.dataFormatsClosed
    (And.intro E.apiEndpointsClosed
      (And.intro E.metadataStandardsClosed E.crossRepositoryLinkingClosed))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse
