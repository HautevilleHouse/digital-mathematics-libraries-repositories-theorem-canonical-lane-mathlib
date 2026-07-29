import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure InteroperabilityPackage where
  protocolVersion : String
  apiEndpoint : String
  dataFormat : String
  authenticationType : String
  rateLimit : Nat
  compressionEnabled : Bool

structure InteroperabilityEvidence (I : InteroperabilityPackage) where
  protocolVersionValid : I.protocolVersion ≠ ""
  apiEndpointValid : I.apiEndpoint ≠ ""
  dataFormatValid : I.dataFormat ∈ ["JSON-LD", "XML", "RDF/XML", "Turtle"]
  authenticationTypeValid : I.authenticationType ∈ ["OAuth2", "APIKey", "None"]
  rateLimitPositive : I.rateLimit > 0

def InteroperabilityClosed (I : InteroperabilityPackage) : Prop :=
  I.protocolVersion ≠ "" ∧ I.apiEndpoint ≠ "" ∧ I.dataFormat ∈ ["JSON-LD", "XML", "RDF/XML", "Turtle"] ∧
  I.authenticationType ∈ ["OAuth2", "APIKey", "None"] ∧ I.rateLimit > 0

theorem interoperability_closed_from_evidence (I : InteroperabilityPackage) (E : InteroperabilityEvidence I) :
    InteroperabilityClosed I := by
  exact And.intro E.protocolVersionValid (And.intro E.apiEndpointValid (And.intro E.dataFormatValid (And.intro E.authenticationTypeValid E.rateLimitPositive)))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse