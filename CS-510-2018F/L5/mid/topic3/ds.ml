
(* This file defines expressed values and environments *)


(* expressed values and environments are defined mutually recursively *)

type exp_val =
  | NumVal of int
  | BoolVal of bool
  | TupleVal of exp_val list
  | ListVal of exp_val list

type env =
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

let tupleVal_to_tuple =  function
  |  TupleVal lst -> lst
  | _ -> failwith "Expected a tuple!"

let listVal_to_list =  function
  | ListVal l -> l
  | _ -> failwith "Expected a list!"

let rec string_of_expval = function
  |  NumVal n -> "NumVal " ^ string_of_int n
  | BoolVal b -> "BoolVal " ^ string_of_bool b
  | ListVal l -> "ListVal " ^ string_of_listval l
  | TupleVal t -> "TupleVal " ^ string_of_listval t
and
  string_of_listval e = String.concat ";" (List.map (fun (x) -> "("^string_of_expval x^")") e)
let rec string_of_env  = function
  | EmptyEnv -> ""
  | ExtendEnv(id,v,env) -> "("^id^","^string_of_expval v^")"^string_of_env env
