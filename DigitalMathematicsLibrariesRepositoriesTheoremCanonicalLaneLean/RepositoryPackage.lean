import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure RepositoryPackage where
  repoName : String
  starCount : Nat
  forkCount : Nat
  hasReadme : Bool
  hasLicense : Bool
  lastCommitDate : String

structure RepositoryEvidence (R : RepositoryPackage) where
  repoNameNonEmpty : R.repoName ≠ ""
  starsPositive : R.starCount > 0
  forksPositive : R.forkCount > 0
  readmePresent : R.hasReadme = true
  licensePresent : R.hasLicense = true
  recentCommit : R.lastCommitDate = "2025-01-01"

def RepositoryClosed (R : RepositoryPackage) : Prop :=
  R.repoName ≠ "" ∧
  R.starCount > 0 ∧
  R.forkCount > 0 ∧
  R.hasReadme = true ∧
  R.hasLicense = true ∧
  R.lastCommitDate = "2025-01-01"

theorem repository_closed_from_evidence (R : RepositoryPackage) (E : RepositoryEvidence R) :
    RepositoryClosed R := by
  exact And.intro E.repoNameNonEmpty (And.intro E.starsPositive (And.intro E.forksPositive (And.intro E.readmePresent (And.intro E.licensePresent E.recentCommit))))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse