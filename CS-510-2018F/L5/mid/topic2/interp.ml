open Ast
open Ds

(* Name:              *)(* Date:              *)

(* ######################  MIDTERM EXAM  ################################# *)
(* You wil implement some extensions to the Let language *)
(* Insr -- Inserts item at the given index location of a list *)
(* Remv -- Removes item at the given index location from a list *)
(* Count -- Counts the number of occurences of an item in a list. 0 if none *)
(* Reverse -- Reverses the list *)

(* You may implement your own helper functions here *)


(* #######################################################################*)


let init_env =
  ExtendEnv("i",NumVal 1,
   ExtendEnv("v",NumVal 5,
    ExtendEnv("x",NumVal 10,
      EmptyEnv)))

let rec eval_expr (en:env) (e:expr) :exp_val =
  match e with
  | Int n          -> NumVal n
  | Var id          ->
    (match apply_env en id with
    | None -> failwith @@ "Variable "^id^" undefined"
    | Some ev -> ev)
  | Add(e1, e2)    ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    NumVal ((numVal_to_num v1) + (numVal_to_num v2))
  | Sub(e1, e2)    ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    NumVal ((numVal_to_num v1) - (numVal_to_num v2))
  | IsZero(e) ->
    let v1 = eval_expr en e  in
    BoolVal (numVal_to_num v1=0)
  | Let(x, e1, e2) ->
    let v1 = eval_expr en e1  in
    eval_expr (extend_env en x v1) e2
  | Tuple(es) ->
    let vs = List.map (eval_expr en) es in
    TupleVal vs
  | Cons(e1, e2) ->         (* Cons(item,list or tuple). Adds the given item at the start of given list or tuple *)
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    let l1 = listVal_to_list v2 in
    ListVal (v1 :: l1)
  | Insr(e1, e2, e3) ->     (* Insr(item,list,index). Inserts given item at given index in given list *)
    failwith "Not implemented"
  | Remv(e1, e2) ->         (* Remv(index,list). Removes item at given index from given list *)
    failwith "Not implemented"
  | Count(e1, e2) ->        (* Count(item,list). Counts the number of occurences of given item in a given list *)
    failwith "Not implemented"
  | Reverse(e1) ->          (* Reverse(list). Returns the reverse of given list *)
    failwith "Not implemented"
  | EmptyList    -> ListVal []

let eval_prog (AProg e) = eval_expr init_env e



(***********************************************************************)
(* Everything above this is essentially the same as we saw in lecture. *)
(***********************************************************************)

(* Parse a string into an ast *)


let parse s =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


(* Interpret an expression *)
let interp (e:string) : exp_val =
  e |> parse |> eval_prog

let ex1 = "
let x = 7
in let y = 2
   in let y = let x = x-1
              in x-y
      in (x-8)- y"

