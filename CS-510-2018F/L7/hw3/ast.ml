(* The type of the abstract syntax tree (AST). *)

type expr =
  | Var of string
  | Int of int
  | Unit
  | Add of expr*expr
  | Sub of expr*expr
  | Mul of expr*expr
  | Div of expr*expr
  | Let of string*expr*expr
  | IsZero of expr
  | ITE of expr*expr*expr
  | Proc of string*texpr*expr
  | App of expr*expr
  | Letrec of texpr*string*string*texpr*expr*expr
  | Set of string*expr
  | BeginEnd of expr list
  | NewRef of expr
  | DeRef of expr
  | SetRef of expr*expr
  (* pair *)
  | Pair of expr*expr
  | Unpair of string*string*expr*expr
  (* list *)
  | EmptyList of texpr
  | Cons of expr*expr
  | Null of expr
  | Hd of expr
  | Tl of expr
  | Debug
  (* tree *)
  | EmptyTree of texpr
  | Node of expr*expr*expr
  | NullT of expr
  | GetData of expr
  | GetLST of expr
  | GetRST of expr
and
  texpr =
  | IntType
  | BoolType
  | UnitType
  | FuncType of texpr*texpr
  | RefType of texpr
  | PairType of texpr*texpr
  | ListType of texpr
  | TreeType of texpr

type prog = AProg of expr


let rec string_of_expr e =
  match e with
  | Var s -> "Var "^s
  | Int n -> "Int "^string_of_int n
  | Unit -> "Unit"
  | Add(e1,e2) -> "Add(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Sub(e1,e2) -> "Sub(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Mul(e1,e2) -> "Mul(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Div(e1,e2) -> "Div(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  (* Ref *)
  | NewRef(e) -> "NewRef(" ^ (string_of_expr e) ^ ")"
  | DeRef(e) -> "DeRef(" ^ (string_of_expr e) ^ ")"
  | SetRef(e1,e2) -> "SetRef(" ^ (string_of_expr e1) ^ "," ^ string_of_expr e2 ^ ")"
  | Let(x,def,body) -> "Let("^x^","^string_of_expr def ^","^ string_of_expr body ^")"
  | Proc(x,t,body) -> "Proc("^x^":"^string_of_texpr t^"," ^ string_of_expr body ^")"
  | App(e1,e2) -> "App("^string_of_expr e1 ^"," ^ string_of_expr e2^")"
  | IsZero(e) -> "Zero?("^string_of_expr e ^")"
  | ITE(e1,e2,e3) -> "IfThenElse("^string_of_expr e1^"," ^ string_of_expr e2^"," ^ string_of_expr e3  ^")"
  | Letrec(tRes,x,param,tPara, def,body) -> "Letrec("^string_of_texpr
  tRes^" "^x^","^param^":"^string_of_texpr tRes ^","^ string_of_expr def ^","^ string_of_expr body ^")"

  (* pair *)
  | Pair(e1, e2) -> "Pair("^(string_of_expr e1)^"*"^string_of_expr e2 ^ ")"
  | Unpair(id1, id2, e_pair, e_body) -> "Unpair((" ^ id1 ^ "," ^ id2 ^ ")= " ^(string_of_expr e_pair) ^ " in " ^ string_of_expr e_body ^")"

  (* list *)
  | EmptyList(te) -> "EmptyList(" ^ string_of_texpr te ^ ")"
  | Cons(he, te) -> "Cons(" ^ (string_of_expr he) ^ "*" ^ string_of_expr te^ ")"
  | Null(e) -> "Null(" ^ string_of_expr e ^ ")"
  | Hd(e) -> "Tl(" ^ string_of_expr e ^ ")"
  | Tl(e) -> "Tl(" ^ string_of_expr e ^ ")"

  (* tree *)
  | EmptyTree(te) -> "EmptyTree(" ^ string_of_texpr te ^ ")"
  | Node(data, lst, rst) -> "Node(" ^ (string_of_expr data) ^ "," ^ (string_of_expr lst) ^ "," ^ (string_of_expr rst) ^ ")"
  | NullT(e) -> "NullT(" ^ (string_of_expr e) ^ ")"
  | GetData(e) -> "GetData(" ^ (string_of_expr e) ^ ")"
  | GetLST(e) -> "GetLST(" ^ (string_of_expr e) ^ ")"
  | GetRST(e) -> "GetRST(" ^ (string_of_expr e) ^ ")"

  | Set(x,rhs) -> "Set("^x^","^string_of_expr rhs^")"
  | BeginEnd(es) -> "BeginEnd(" ^ List.fold_left (fun x y -> x^","^y)
                      "" (List.map string_of_expr es) ^")"

  | Debug -> "Debug"
  
and string_of_texpr = function
  | IntType -> "int"
  | BoolType -> "bool"
  | FuncType(t1,t2) -> "("^string_of_texpr t1^"->"^string_of_texpr t2^")"
  | RefType(t) -> "Ref("^string_of_texpr t^")"
  (* TODO: UnitType
   *       PairType
   *       ListType
   *       TreeType *)
  | UnitType -> "unit"
  | PairType(t1,t2) -> "Pair("^string_of_texpr t1^","^string_of_texpr t2^")"
  | ListType(t1) -> "List("^string_of_texpr t1^")"
  | TreeType(t1) -> "Tree("^string_of_texpr t1^")"

let string_of_prog (AProg e)  = string_of_expr e