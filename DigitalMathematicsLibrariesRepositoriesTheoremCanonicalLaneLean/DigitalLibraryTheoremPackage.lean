import DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean.DigitalLibraryMetadataPackage

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalLibraryTheoremPackage {R : DigitalLibraryRepositoryPackage}
    (M : DigitalLibraryMetadataPackage R) where
  theoremName : String
  theoremStatement : Prop
  theoremProof : Prop
  theoremBridges : Prop
  theoremAdmissible : Prop

structure DigitalLibraryTheoremEvidence {R : DigitalLibraryRepositoryPackage}
    {M : DigitalLibraryMetadataPackage R} (T : DigitalLibraryTheoremPackage M) where
  theoremStatementClosed : T.theoremStatement
  theoremProofClosed : T.theoremProof
  theoremBridgesClosed : T.theoremBridges
  theoremAdmissibleClosed : T.theoremAdmissible

def DigitalLibraryTheoremClosed {R : DigitalLibraryRepositoryPackage}
    {M : DigitalLibraryMetadataPackage R} (T : DigitalLibraryTheoremPackage M) : Prop :=
  T.theoremStatement ∧ T.theoremProof ∧ T.theoremBridges ∧ T.theoremAdmissible

theorem digital_library_theorem_closed_from_evidence
    {R : DigitalLibraryRepositoryPackage} {M : DigitalLibraryMetadataPackage R}
    (T : DigitalLibraryTheoremPackage M) (E : DigitalLibraryTheoremEvidence T) :
    DigitalLibraryTheoremClosed T := by
  exact And.intro E.theoremStatementClosed
    (And.intro E.theoremProofClosed
      (And.intro E.theoremBridgesClosed E.theoremAdmissibleClosed))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse