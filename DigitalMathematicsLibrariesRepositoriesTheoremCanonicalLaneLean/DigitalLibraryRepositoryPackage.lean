import DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean.DigitalLibraryAdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalLibraryRepositoryPackage where
  repoName : String
  repoMetadata : Prop
  repoTheorems : List String
  repoProofs : List String
  repoBridges : List String
  repoAdmissible : Prop

structure DigitalLibraryRepositoryEvidence (R : DigitalLibraryRepositoryPackage) where
  repoAdmissibleClosed : R.repoAdmissible

def DigitalLibraryRepositoryClosed (R : DigitalLibraryRepositoryPackage) : Prop :=
  R.repoAdmissible

theorem digital_library_repository_closed_from_evidence
    (R : DigitalLibraryRepositoryPackage) (E : DigitalLibraryRepositoryEvidence R) :
    DigitalLibraryRepositoryClosed R := by
  exact E.repoAdmissibleClosed

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse