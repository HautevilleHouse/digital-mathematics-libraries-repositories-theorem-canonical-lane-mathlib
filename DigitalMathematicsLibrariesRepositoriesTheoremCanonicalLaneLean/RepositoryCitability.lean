import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure RepositoryCitability where
  citationFile : String
  authors : List String
  title : String
  year : Nat
  license : String
  version : String
deriving Repr, DecidableEq

structure CitabilityEvidence (C : RepositoryCitability) where
  citationFileValid : Prop
  authorsNonempty : C.authors ≠ []
  yearPositive : C.year > 0

def CitabilityClosed (C : RepositoryCitability) : Prop :=
  C.authors ≠ [] ∧ C.year > 0

theorem citability_closed_from_evidence (C : RepositoryCitability) (E : CitabilityEvidence C) : CitabilityClosed C :=
  And.intro E.authorsNonempty E.yearPositive

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse