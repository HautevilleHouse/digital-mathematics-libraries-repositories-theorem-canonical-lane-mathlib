import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure BibliographicRecord where
  doi : String
  title : String
  authors : List String
  year : Nat
  verifiedOpenAccess : Prop

define BibliographicBridgePackage where
  records : List BibliographicRecord
  crossRefIntegrated : Prop
  citationGraphResolved : Prop

structure BibliographicBridgeEvidence (B : BibliographicBridgePackage) where
  crossRefIntegratedClosed : B.crossRefIntegrated
  citationGraphResolvedClosed : B.citationGraphResolved

def BibliographicBridgeClosed (B : BibliographicBridgePackage) : Prop :=
  B.crossRefIntegrated ∧ B.citationGraphResolved

theorem bibliographic_bridge_closed_from_evidence (B : BibliographicBridgePackage)
    (E : BibliographicBridgeEvidence B) : BibliographicBridgeClosed B := by
  exact And.intro E.crossRefIntegratedClosed E.citationGraphResolvedClosed

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse