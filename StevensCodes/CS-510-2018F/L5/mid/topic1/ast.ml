(* The type of the abstract syntax tree (AST). *)
type expr =
  | Var of string
  | Int of int
  | Add of expr*expr
  | Sub of expr*expr
  | Mul of expr*expr
  | Div of expr*expr
  | Let of string*expr*expr
  | IsZero of expr
  | ITE of expr*expr*expr
  | Abs of expr
  | Cons of expr*expr
  | Append of expr*expr
  | Insr of expr*expr*expr
  | Remv of expr*expr
  | Count of expr*expr
  | Reverse of expr
  | Replace of expr*expr*expr
  | Repetition of expr*expr
  | Remove_dup of expr
  | Intersection of expr*expr
  | Hd of expr
  | Tl of expr
  | Null of expr
  | EmptyList

let rec string_of_expr e =
  match e with
  | Var s -> "Var "^s
  | Int n -> "Int "^string_of_int n
  | Add(e1,e2) -> "Add(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Sub(e1,e2) -> "Sub(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Mul(e1,e2) -> "Mul(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Div(e1,e2) -> "Div(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Let(x,def,body) -> "Let("^x^","^string_of_expr def ^","^ string_of_expr body ^")"
  | IsZero(e1) -> "Zero?("^string_of_expr e1 ^")"
  | ITE(e1,e2,e3) -> "IfThenElse("^string_of_expr e1^"," ^ string_of_expr e2^"," ^ string_of_expr e3  ^")"
  | Abs(e1) -> "Abs("^string_of_expr e1^")"
  | Cons(e1,e2) -> "Cons(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Append(e1,e2) -> "Append(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Insr(e1,e2,e3) -> "Insr(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ "," ^ (string_of_expr e3) ^ ")"
  | Remv(e1,e2) -> "Remv(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ ")"
  | Count(e1,e2) -> "Count(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Reverse(e1) -> "Reverse("^string_of_expr e1 ^")"
  | Replace(e1,e2,e3) -> "Replace(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ "," ^ (string_of_expr e3) ^ ")"
  | Repetition(e1,e2) -> "Repetition(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Remove_dup(e1) -> "Remove_dup("^string_of_expr e1^")"
  | Intersection(e1,e2) -> "Intersection("^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Hd(e1) -> "Hd("^string_of_expr e1 ^")"
  | Tl(e1) -> "Tl("^string_of_expr e1 ^")"
  | Null(e1) -> "Null("^string_of_expr e1 ^")"
  | EmptyList -> "EmptyList"
