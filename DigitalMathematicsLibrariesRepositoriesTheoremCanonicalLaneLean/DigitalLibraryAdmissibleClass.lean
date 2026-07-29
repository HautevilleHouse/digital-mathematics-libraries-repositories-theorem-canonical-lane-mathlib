import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure AdmissibleLibraryObject where
  repository : Type u
  metadata : Prop
  theorems : Prop
  proofs : Prop
  bridges : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : AdmissibleLibraryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse