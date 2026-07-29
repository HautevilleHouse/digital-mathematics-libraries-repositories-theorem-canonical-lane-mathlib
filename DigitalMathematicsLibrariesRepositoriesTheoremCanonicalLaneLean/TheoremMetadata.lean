import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure TheoremMetadata where
  theoremName : String
  statement : Prop
  proofURL : String
  dependencies : List String
  isFormalized : Bool

structure TheoremMetadataEvidence (T : TheoremMetadata) where
  theoremNameNonEmpty : T.theoremName ≠ ""
  statementClosed : T.statement
  proofURLValid : T.proofURL.startsWith "https://"
  dependenciesListed : T.dependencies.length > 0
  formalizationStatusKnown : T.isFormalized = true

def TheoremMetadataClosed (T : TheoremMetadata) : Prop :=
  T.theoremName ≠ "" ∧
  T.statement ∧
  T.proofURL.startsWith "https://" ∧
  T.dependencies.length > 0 ∧
  T.isFormalized = true

theorem theorem_metadata_closed_from_evidence (T : TheoremMetadata) (E : TheoremMetadataEvidence T) :
    TheoremMetadataClosed T := by
  exact And.intro E.theoremNameNonEmpty (And.intro E.statementClosed (And.intro E.proofURLValid (And.intro E.dependenciesListed E.formalizationStatusKnown)))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse