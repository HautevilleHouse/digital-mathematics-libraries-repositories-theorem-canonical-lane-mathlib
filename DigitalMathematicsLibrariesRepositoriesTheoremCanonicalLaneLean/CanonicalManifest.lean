import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure ManifestEntry where
  path : String
  sha256 : String
deriving Repr, DecidableEq

structure CanonicalManifest where
  entries : List ManifestEntry
  manifestValid : Prop
  entryCount : Nat
deriving Repr, DecidableEq

structure ManifestEvidence (M : CanonicalManifest) where
  manifestValidClosed : M.manifestValid
  entryCountMatches : M.entryCount = List.length M.entries

def ManifestClosed (M : CanonicalManifest) : Prop :=
  M.manifestValid ∧ M.entryCount = List.length M.entries

theorem manifest_closed_from_evidence (M : CanonicalManifest) (E : ManifestEvidence M) : ManifestClosed M :=
  And.intro E.manifestValidClosed E.entryCountMatches

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse