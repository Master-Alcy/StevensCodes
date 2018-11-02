(* The type of the abstract syntax tree (AST). *)

type expr =
  | Var of string
  | Int of int
  | Add of expr*expr
  | Sub of expr*expr
  | Mul of expr*expr
  | Div of expr*expr
  | Let of string*expr*expr
  | Proc of string*expr
  | App of expr*expr
  | IsZero of expr
  | ITE of expr*expr*expr
  | Letrec of string*string*expr*expr
  | Set of string*expr
  | BeginEnd of expr list
  | NewRef of expr
  | DeRef of expr
  | SetRef of expr*expr
  | Tuple of expr list
  | LetTuple of (string list)*expr*expr
  | Cons of expr*expr
  | ConsT of expr*expr
  | Append of expr*expr
  | AppendT of expr*expr
  | Sublist of expr*expr*expr
  | Insr of expr*expr*expr
  | Remv of expr*expr
  | Count of expr*expr
  | Reverse of expr
  | Remove_dup of expr
  | Union of expr*expr
  | EmptyList

type prog = AProg of expr

let rec string_of_expr e =
  match e with
  | Var s -> "Var "^s
  | Int n -> "Int "^string_of_int n
  | Add(e1,e2) -> "Add(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Sub(e1,e2) -> "Sub(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Mul(e1,e2) -> "Mul(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Div(e1,e2) -> "Div(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | NewRef(e) -> "NewRef(" ^ (string_of_expr e) ^ ")"
  | DeRef(e) -> "DeRef(" ^ (string_of_expr e) ^ ")"
  | SetRef(e1,e2) -> "SetRef(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Let(x,def,body) -> "Let("^x^","^string_of_expr def ^","^ string_of_expr body ^")"
  | Proc(x,body) -> "Proc("^x^"," ^ string_of_expr body ^")"
  | App(e1,e2) -> "App("^string_of_expr e1 ^"," ^ string_of_expr e2^")"
  | IsZero(e) -> "Zero?("^string_of_expr e ^")"
  | ITE(e1,e2,e3) -> "IfThenElse("^string_of_expr e1^"," ^ string_of_expr e2^"," ^ string_of_expr e3  ^")"
  | Letrec(x,param,def,body) -> "Letrec("^x^","^ param ^","^ string_of_expr def ^","^ string_of_expr body ^")"
  | Set(x,rhs) -> "Set("^x^","^string_of_expr rhs^")"
  | BeginEnd(es) -> "BeginEnd(" ^ List.fold_left (fun x y -> x^","^y)
                      "" (List.map string_of_expr es) ^")"
  | Cons(e1,e2) -> "Cons(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | ConsT(e1,e2) -> "ConsT(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Append(e1,e2) -> "Append(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | AppendT(e1,e2) -> "AppendT(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Insr(e1,e2,e3) -> "Insr(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ "," ^ (string_of_expr e3) ^ ")"
  | Sublist(e1,e2,e3) -> "Sublist(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ "," ^ (string_of_expr e3) ^ ")"
  | Remv(e1,e2) -> "Remv(" ^ (string_of_expr e1) ^ "," ^ (string_of_expr e2) ^ ")"
  | Count(e1,e2) -> "Count(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Reverse(e1) -> "Reverse("^string_of_expr e1 ^")"
  | Remove_dup(e1) -> "Remove_dup("^string_of_expr e1 ^")"
  | Union(e1,e2) -> "Union(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | EmptyList -> "EmptyList"
  | _ -> "not implemented"

let string_of_prog (AProg e)  = string_of_expr e
