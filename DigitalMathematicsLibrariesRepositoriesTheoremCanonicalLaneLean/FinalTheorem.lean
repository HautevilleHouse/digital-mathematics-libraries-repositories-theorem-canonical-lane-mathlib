import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

def ConstrainedDMLClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dml_endgame (A : AdmissibleClass) :
    ConstrainedDMLClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse