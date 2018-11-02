open Ast
open Ds


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
  | Proc(x,e)      -> failwith "Not implemented"
  | App(e1,e2)     -> failwith "Not implemented"

  | Let(x, e1, e2) ->
    let v1 = eval_expr en e1  in
    (*let extend_env (env:env) (id:string) (v:exp_val):env = ExtendEnv(id,v,env)
    This is extending the env to include new features*)
    eval_expr (extend_env en x v1) e2
  
  | Tuple (es) -> (*es is a list of elements. Applying recursively with eval_expr en
    eval_expr en e is the full function, without the last e means applying a function
    Thus, this is applying the same function to all elements in list. The return type should be 'b list, 
    where 'b is the individual exp_val list returned by eval_expr en (e list).*)
    TupleVal (List.rev_map (eval_expr en) es)

  (*parse "untuple (x,y,z) = (1,2,3) in x+y+z";;*)
  | LetTuple (ids, e1, e2) -> (*ids is elements in untuple
  e1 is declaration of a tuple and e2 is the body applying to *)
  (*ids is string list !!!*)
    let v = eval_expr en e1 in
    (match v with
    | TupleVal(vl) -> (*v1 is a list of values in tuple*)
      if List.length vl == List.length ids 
      (*Note that the type of vl is exp_val list, not the same with ids*)
      then eval_expr_tuple en ids vl e2
      (*call a function to apply, like the 
      "eval_expr (extend_env en x v1) e2" in Let(x,e1,e2)*)
      else failwith "ids and e1 not match"
    | _ -> failwith "Not a tuple.")
  | _ -> failwith("Not implemented")

  and

  eval_expr_tuple en ids vs e =
  (*ids is string list, vs is exp_val list*)
   match ids,vs with
   |[],[] -> eval_expr en e
   |id::ids', v::vs' -> 
   eval_expr_tuple(extend_env en id v) ids' vs' e
   (*extend_env en id v is the new environment used to recursively call the eval_expr_tuple*)
   (*finally e will see all the environment it needs to finish the interp or parse*)
   |_ ->failwith "inside eval_expr_tuple"

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

