
(* This file defines expressed values and environments *)


(* expressed values and environments are defined mutually recursively *)

type exp_val =
  | NumVal of int
  | BoolVal of bool
  | ProcVal of (string list) *Ast.expr*env
  | TupleVal of exp_val list
and
  env =
  | EmptyEnv
  | ExtendEnv of string*exp_val*env

(* Operations on environments *)

let empty_env (x:unit):env = EmptyEnv

let extend_env (env:env) (id:string) (v:exp_val):env = ExtendEnv(id,v,env)

let rec apply_env (env:env) (id:string):exp_val option =
  match env with
  | EmptyEnv -> None
  | ExtendEnv (key,value,env) ->
    if id=key
    then Some value
    else apply_env env id


(* operations on expressed values *)

let numVal_to_num =  function
  |  NumVal n -> n
  | _ -> failwith "Expected a number!"

let boolVal_to_bool =  function
  |  BoolVal b -> b
  | _ -> failwith "Expected a boolean!"

let  tupleVal_to_evs : (exp_val -> exp_val list)= function
  | TupleVal(evs) -> evs
  | _ -> failwith "Expected a Tuple!"

let rec string_of_list_of_strings = function
  | [] -> ""
  | [id] -> id
  | id :: ids -> id ^ "," ^ string_of_list_of_strings ids

let rec string_of_expval = function
  |  NumVal n -> "NumVal " ^ string_of_int n
  | BoolVal b -> "BoolVal " ^ string_of_bool b
  | ProcVal (ids,body,env) -> "ProcVal ("^ string_of_list_of_strings ids ^","^Ast.string_of_expr body^","^ string_of_env env^")"
  | TupleVal(evs) -> "Tuple (" ^ string_of_list_of_strings (List.map string_of_expval evs) ^ ")"
and
  string_of_env  = function
  | EmptyEnv -> ""
  | ExtendEnv(id,v,env) -> "("^id^","^string_of_expval v^")"^string_of_env env