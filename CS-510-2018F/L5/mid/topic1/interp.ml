open Ast
open Ds

(* Name: Jingxuan Ai *)(* Date: 18/10/18 *)

(* ######################  MIDTERM EXAM  ################################# *)
(* You wil implement some extensions to the Let language *)
(* Replace -- Replaces item at the given index location of a list *)
(* Repetition -- Repeats every item from a list N times *)
(* Remove_dup -- Removes duplicates from a list *)
(* Intersection -- Returns the intersection of two lists *)

(* You may implement your own helper functions here *)


(* #######################################################################*)

let rec foldi num f li lx=
    if num <= 0 then li else foldi (pred num) f (f lx li) lx

let rec remAdjDups (ls: 'a list) : 'a list =
  match ls with
  | [] -> []
  | x :: [] -> x :: []
  | x :: y :: rest ->
    if x = y
    then remAdjDups (y :: rest) 
    else x :: remAdjDups (y :: rest)

let rec intersection_ext (l1:'a list) (l2:'a list) : 'a list = 
  match l1 with
  | [] -> []
  | x :: xs ->
    if List.mem x l2
    then x :: intersection_ext xs l2
    else intersection_ext xs l2
  

let rec eval (en:env) (e:expr):exp_val =
  match e with
  | Int n          -> NumVal n
  | Var x          -> lookup en x
  | Add(e1, e2)    ->
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    NumVal ((numVal_to_num v1) + (numVal_to_num v2))
  | Sub(e1, e2)    ->
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    NumVal ((numVal_to_num v1) - (numVal_to_num v2))
  | Div(e1, e2)    ->
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    NumVal ((numVal_to_num v1) / (numVal_to_num v2))
  | Mul(e1, e2)    ->
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    NumVal ((numVal_to_num v1) * (numVal_to_num v2))
  | Let(x, e1, e2) ->
    let v1 = eval en e1  in
    eval (extend_env en x v1) e2
  | IsZero(e1) ->
    let v1 = eval en e1  in
    let n1 = numVal_to_num v1 in
    BoolVal (n1 = 0)
  | ITE(e1, e2, e3) ->
    let v1 = eval en e1  in
    let b1 = boolVal_to_bool v1 in
    if b1 then eval en e2 else eval en e3
  | Abs(e1)      ->
    let v1 = eval en e1 in
    NumVal (abs (numVal_to_num v1))
  | Cons(e1, e2) ->         (* using Cons from hw2 *)
    let v1 = eval en e1 in
    let v2 = eval en e2  in
    let l1 = listVal_to_list v2 in
    ListVal (v1 :: l1)

  | Replace(e1,e2,e3) ->    
  (* Replace(item,list,index). Replaces item at given 
  index from given list with given new item *)
    let v1 = eval en e1 in  (* item in exp_val *)
    let v2 = eval en e2 in
    let v3 = eval en e3 in
    let n1 = numVal_to_num v3 in (* index *)
    let l1 = listVal_to_list v2 in (* a list of exp_val *)
    ListVal (List.mapi (fun i x -> if i = n1 then v1 else x) l1)

  | Repetition(e1,e2) ->           
  (* repetition(list,N). Repeats each item in list N times. *)
  (* Repetition([1;2;3],3) -> [1;1;1;2;2;2;3;3;3] *) 
  (* Repetition([],2) -> [] *) 
  (* Repetition([1;2;3],0) -> [] *) 
    let v1 = eval en e1 in 
    let v2 = eval en e2 in 
    let n1 = numVal_to_num v2 in  (* number *)
    let l1 = listVal_to_list v1 in (* list *) 
    (match l1, n1 with
    | ls, 0 -> ListVal []
    | [], n -> ListVal []
    | l1, n1 -> 
    ListVal( foldi (n1-1) (fun lx li -> lx @ li) l1 l1 )
    )

  | Remove_dup(e) ->        
  (* Remove_dup([1;1;2;1;3;2]) -> [1;2;3] *)
  (* remove_dup(list). Removes all the duplicate items from the list. *)
    let v1 = eval en e in
    let l1 = listVal_to_list v1 in
    ListVal(remAdjDups l1)

  | Intersection(e1,e2) ->   
  (* Intersection([1;2;3],[4;5;2;3]) -> [2;3] *) 
  (* Intersection([1;2;3], [4;5;6]) -> [] *)
    let v1 = eval en e1 in
    let v2 = eval en e2 in
    let l1 = listVal_to_list v1 in
    let l2 = listVal_to_list v2 in
    ListVal(intersection_ext l1 l2)

  | EmptyList    -> ListVal []
  | _ -> failwith "Exception here."



(***********************************************************************)
(* Everything above this is essentially the same as we saw in lecture. *)
(***********************************************************************)

(* Parse a string into an ast *)
let parse s =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


(* Interpret an expression *)
let interp (e:string):exp_val =
  e |> parse |> eval (empty_env ())