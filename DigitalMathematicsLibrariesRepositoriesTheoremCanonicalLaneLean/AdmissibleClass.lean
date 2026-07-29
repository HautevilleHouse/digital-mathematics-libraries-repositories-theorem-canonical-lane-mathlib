import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure DigitalMathLibraryAdmittedObject where
  repository : DigitalRepositoryPackage
  metadataSchema : SemanticMetadataPackage
  interoperability : InteroperabilityPackage
  citationGraph : CitationGraphPackage
  conclusion : DigitalRepositoryClosed repository ∧ SemanticMetadataClosed metadataSchema ∧
    InteroperabilityClosed interoperability ∧ CitationGraphClosed citationGraph

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse