open Ast
open Ds

(* Name:              *)
(* Date:              *)

(* ######################  MIDTERM EXAM  ################################# *)
(* Remv -- Removes item at the given index location from a list *)
(* Sublist -- Returns the sublist of given list from start index to end index(inclusive) *)
(* Remove_dup -- Removes duplicates from a list *)
(* Union -- Returns the Union of two lists *)


(* You may implement your own helper functions here *)


(* #######################################################################*)


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
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    let l1 = match v2 with
    | ListVal a -> a
    | TupleVal a -> a
    in ListVal (v1 :: l1)
  | Append(e1, e2) ->       (* Append(item,list or tuple). Adds the given item at the end of given list or tuple *)
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2 in 
    let lst = match v2 with
    | ListVal a -> a
    | TupleVal a -> a
    in ListVal (lst@[v1])
  | Remv(e1, e2) ->         (* Remv(index,list). Removes item at given index from given list *)
    failwith "Not implemented"
  | Sublist(e1,e2,e3) ->    (* Sublist(list,start_index,end_index) *) (* Sublist([1;2;3;4],0,2) -> [1;2;3] *) (* Sublist([1;2;3;4],1,1) -> [2] *) (* Sublist([1;2;3;4],0,5) -> Error message *)
    failwith "Not implemented"
  | Remove_dup(e) ->        (* Remove_dup([1;1;2;1;3;2]) -> [1;2;3] *)
    failwith "Not implemented"
  | Union(e1,e2) ->   (* Union([1;2;3],[4;5;2;3]) -> [1;2;3;4;5] *) (* Union([1;2;3], [4;5;6]) -> [1;2;3;4;5;6] *)
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

