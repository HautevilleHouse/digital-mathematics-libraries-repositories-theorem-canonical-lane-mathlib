import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure RepositoryMetadata where
  sourceRepo : String
  checkoutHead : String
  repoType : String
  primaryLanguage : String
  fileCount : Nat
  functionCount : Nat
  theoremCount : Nat
  metadataValid : Bool

structure RepositoryMetadataEvidence (M : RepositoryMetadata) where
  metadataValidClosed : M.metadataValid

def RepositoryMetadataClosed (M : RepositoryMetadata) : Prop :=
  M.metadataValid

theorem repository_metadata_closed_from_evidence (M : RepositoryMetadata) (E : RepositoryMetadataEvidence M) : RepositoryMetadataClosed M :=
  E.metadataValidClosed

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse