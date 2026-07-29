import canonicalLaneMathlib.AdmissibleClass

/-!
# Canonical Repository Package
-/

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure CanonicalRepositoryPackage where
  repositoryStructure : Prop
  metadataRecorded : Prop
  versionControl : Prop
  preservationPolicy : Prop

structure CanonicalRepositoryEvidence (C : CanonicalRepositoryPackage) where
  repositoryStructureClosed : C.repositoryStructure
  metadataRecordedClosed : C.metadataRecorded
  versionControlClosed : C.versionControl
  preservationPolicyClosed : C.preservationPolicy

def CanonicalRepositoryClosed (C : CanonicalRepositoryPackage) : Prop :=
  C.repositoryStructure ∧ C.metadataRecorded ∧ C.versionControl ∧ C.preservationPolicy

theorem canonical_repository_closed_from_evidence
    (C : CanonicalRepositoryPackage) (E : CanonicalRepositoryEvidence C) :
    CanonicalRepositoryClosed C := by
  exact And.intro E.repositoryStructureClosed
    (And.intro E.metadataRecordedClosed
      (And.intro E.versionControlClosed E.preservationPolicyClosed))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse
