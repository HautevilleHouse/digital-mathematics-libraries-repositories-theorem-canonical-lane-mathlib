import DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean.DigitalLibraryRepositoryPackage

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalLibraryMetadataPackage (R : DigitalLibraryRepositoryPackage) where
  metadataValid : Prop
  theoremsIndexed : Prop
  proofsIndexed : Prop
  bridgesIndexed : Prop
  metadataConsistent : Prop

structure DigitalLibraryMetadataEvidence {R : DigitalLibraryRepositoryPackage}
    (M : DigitalLibraryMetadataPackage R) where
  metadataValidClosed : M.metadataValid
  theoremsIndexedClosed : M.theoremsIndexed
  proofsIndexedClosed : M.proofsIndexed
  bridgesIndexedClosed : M.bridgesIndexed
  metadataConsistentClosed : M.metadataConsistent

def DigitalLibraryMetadataClosed {R : DigitalLibraryRepositoryPackage}
    (M : DigitalLibraryMetadataPackage R) : Prop :=
  M.metadataValid ∧ M.theoremsIndexed ∧ M.proofsIndexed ∧ M.bridgesIndexed ∧ M.metadataConsistent

theorem digital_library_metadata_closed_from_evidence
    {R : DigitalLibraryRepositoryPackage} (M : DigitalLibraryMetadataPackage R)
    (E : DigitalLibraryMetadataEvidence M) : DigitalLibraryMetadataClosed M := by
  exact And.intro E.metadataValidClosed
    (And.intro E.theoremsIndexedClosed
      (And.intro E.proofsIndexedClosed
        (And.intro E.bridgesIndexedClosed E.metadataConsistentClosed)))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse