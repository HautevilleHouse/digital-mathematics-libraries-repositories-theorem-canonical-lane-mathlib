import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure SemanticMetadataPackage where
  identifier : String
  title : String
  creator : String
  subject : String
  description : String
  publisher : String
  contributor : String
  date : String
  type : String
  format : String
  source : String
  language : String
  relation : String
  coverage : String
  rights : String

structure SemanticMetadataEvidence (M : SemanticMetadataPackage) where
  identifierValid : M.identifier ≠ ""
  titleNonempty : M.title ≠ ""
  creatorNonempty : M.creator ≠ ""
  subjectNonempty : M.subject ≠ ""
  descriptionNonempty : M.description ≠ ""

def SemanticMetadataClosed (M : SemanticMetadataPackage) : Prop :=
  M.identifier ≠ "" ∧ M.title ≠ "" ∧ M.creator ≠ "" ∧ M.subject ≠ "" ∧ M.description ≠ ""

theorem semantic_metadata_closed_from_evidence (M : SemanticMetadataPackage) (E : SemanticMetadataEvidence M) :
    SemanticMetadataClosed M := by
  exact And.intro E.identifierValid (And.intro E.titleNonempty (And.intro E.creatorNonempty (And.intro E.subjectNonempty E.descriptionNonempty)))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse