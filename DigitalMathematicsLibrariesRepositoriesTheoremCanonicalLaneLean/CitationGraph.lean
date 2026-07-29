import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

structure CitationNode where
  identifier : String
  title : String
  authors : List String
  year : Nat

structure CitationEdge where
  source : String
  target : String
  relation : String -- e.g., "cites", "isSupplementedBy"

structure CitationGraphPackage where
  nodes : List CitationNode
  edges : List CitationEdge
  directed : Bool
  acyclic : Bool
  weighted : Bool

structure CitationGraphEvidence (G : CitationGraphPackage) where
  nodesNonempty : G.nodes ≠ []
  edgesValid : ∀ e ∈ G.edges, e.source ∈ (G.nodes.map (λ n => n.identifier)) ∧
    e.target ∈ (G.nodes.map (λ n => n.identifier))
  directedConsistent : G.directed → (G.edges.all (λ e => e.relation = "cites"))
  acyclicConsistent : G.acyclic → (∀ e ∈ G.edges, e.source ≠ e.target)

def CitationGraphClosed (G : CitationGraphPackage) : Prop :=
  G.nodes ≠ [] ∧ (∀ e ∈ G.edges, e.source ∈ (G.nodes.map (λ n => n.identifier)) ∧
    e.target ∈ (G.nodes.map (λ n => n.identifier))) ∧
  (G.directed → (G.edges.all (λ e => e.relation = "cites"))) ∧
  (G.acyclic → (∀ e ∈ G.edges, e.source ≠ e.target))

theorem citation_graph_closed_from_evidence (G : CitationGraphPackage) (E : CitationGraphEvidence G) :
    CitationGraphClosed G := by
  exact And.intro E.nodesNonempty (And.intro E.edgesValid (And.intro E.directedConsistent E.acyclicConsistent))

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse