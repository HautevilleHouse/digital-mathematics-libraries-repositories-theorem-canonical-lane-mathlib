import DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean.DigitalLibraryGateLemmas

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

def ConstrainedDigitalLibraryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_digital_library_endgame (A : AdmissibleClass) :
    ConstrainedDigitalLibraryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse