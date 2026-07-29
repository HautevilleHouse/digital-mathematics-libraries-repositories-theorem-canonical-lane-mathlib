import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : String)
  | add (lhs rhs : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
  | mul (lhs rhs : FormulaExpr)
  | div (lhs rhs : FormulaExpr)
  | neg (arg : FormulaExpr)
  | abs (arg : FormulaExpr)
  | min (lhs rhs : FormulaExpr)
  | max (lhs rhs : FormulaExpr)
  | raw (formula : String)
deriving Repr, DecidableEq

structure FormulaComponent where
  key : String
  value : String
deriving Repr, DecidableEq

structure ExtractedFormula where
  group : String
  key : String
  status : String
  formula : String
  expr : FormulaExpr
  parseStatus : String
  sourceSection : String
  notes : String
  validation : String
  componentKeys : List String
  components : List FormulaComponent
deriving Repr, DecidableEq

structure ExtractionEvidence (F : ExtractedFormula) where
  parseOk : F.parseStatus = "parsed_source_expression"
  validationOk : Prop

def ExtractionClosed (F : ExtractedFormula) : Prop :=
  F.parseStatus = "parsed_source_expression" ∧ F.validation = "required_positive"

theorem extraction_closed_from_evidence (F : ExtractedFormula) (E : ExtractionEvidence F) : ExtractionClosed F :=
  by
    refine And.intro E.parseOk ?_
    exact E.validationOk

end DigitalMathematicsLibrariesRepositoriesTheoremCanonicalLaneLean
end HautevilleHouse