import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalObjectIdentifier where
  doi : String
  registry : String
  resolved : Prop
  metadataValid : Prop
deriving Repr, DecidableEq

structure DOIEvidence (D : DigitalObjectIdentifier) where
  resolvedClosed : D.resolved
  metadataValidClosed : D.metadataValid

def DOIClosed (D : DigitalObjectIdentifier) : Prop :=
  D.resolved ∧ D.metadataValid

theorem doi_closed_from_evidence (D : DigitalObjectIdentifier) (E : DOIEvidence D) : DOIClosed D :=
  And.intro E.resolvedClosed E.metadataValidClosed

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse