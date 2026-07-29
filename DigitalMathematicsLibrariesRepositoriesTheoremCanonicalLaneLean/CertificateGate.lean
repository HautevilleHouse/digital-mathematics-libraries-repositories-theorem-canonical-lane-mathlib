import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure CertificateGate where
  gate : String
  status : String
deriving Repr, DecidableEq

structure CertificateInput where
  key : String
  value : String
deriving Repr, DecidableEq

structure GateCertificate where
  gates : List CertificateGate
  inputs : List CertificateInput
  allPass : Bool
deriving Repr, DecidableEq

structure GateEvidence (C : GateCertificate) where
  allPassClosed : C.allPass = true

def GateClosed (C : GateCertificate) : Prop :=
  C.allPass = true

theorem gate_closed_from_evidence (C : GateCertificate) (E : GateEvidence C) : GateClosed C :=
  E.allPassClosed

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse