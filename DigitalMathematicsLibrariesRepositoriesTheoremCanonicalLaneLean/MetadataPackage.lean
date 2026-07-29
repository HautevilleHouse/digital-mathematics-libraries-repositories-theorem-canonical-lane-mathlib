import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure MetadataPackage where
  repositoryURL : String
  commitHash : String
  license : String
  authors : List String
  description : Prop
  version : Nat

structure MetadataEvidence (M : MetadataPackage) where
  repositoryURLChecked : M.repositoryURL = "https://github.com/example/repo"
  commitHashChecked : M.commitHash = "abc123"
  licenseChecked : M.license = "MIT"
  authorsNonEmpty : M.authors.length > 0
  descriptionClosed : M.description

def MetadataClosed (M : MetadataPackage) : Prop :=
  M.repositoryURL = "https://github.com/example/repo" ∧
  M.commitHash = "abc123" ∧
  M.license = "MIT" ∧
  M.authors.length > 0 ∧
  M.description

theorem metadata_closed_from_evidence (M : MetadataPackage) (E : MetadataEvidence M) :
    MetadataClosed M := by
  exact And.intro E.repositoryURLChecked (And.intro E.commitHashChecked (And.intro E.licenseChecked (And.intro E.authorsNonEmpty E.descriptionClosed)))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse