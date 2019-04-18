
(* This file defines expressed values and environments *)
open Ast

(* expressed values and environments are defined mutually recursively *)

type exp_val =
  | NumVal of int
  | BoolVal of bool
  | ProcVal of string*expr*env
  | UnitVal
  | RefVal of int
and
  env =
  | EmptyEnv
  | ExtendEnv of string*exp_val*env
  | ExtendEnvRec of string*string*expr*env

type tenv = 
  | EmptyTEnv
  | ExtendTEnv of string*texpr*tenv

(* Operations on environments *)

let empty_env (x:unit):env = EmptyEnv

let empty_tenv (x:unit):tenv = EmptyTEnv

let extend_env (env:env) (id:string) (v:exp_val):env = ExtendEnv(id,v,env)

let extend_tenv (id:string) (v:texpr) (tenv:tenv) :tenv = ExtendTEnv(id,v,tenv)

let rec apply_env (st:exp_val Store.t) (env:env) (id:string):exp_val option =
  match env with
  | EmptyEnv -> None
  | ExtendEnv (key,value,env) ->
    if id=key
    then Some value
    else apply_env st env id
  | ExtendEnvRec(key,param,body,en) ->
    if id=key
    then Some (RefVal (Store.new_ref st (ProcVal(param,body,env))))
    else apply_env st en id

let rec apply_tenv (tenv:tenv) (id:string) : texpr option =
  match tenv with
  | EmptyTEnv -> None
  | ExtendTEnv (key,value,tenv) ->
    if id = key
    then Some value
    else apply_tenv tenv id


(* operations on expressed values *)

let numVal_to_num =  function
  |  NumVal n -> n
  | _ -> failwith "Expected a number!"

let boolVal_to_bool =  function
  |  BoolVal b -> b
  | _ -> failwith "Expected a boolean!"

let refVal_to_int =  function
  |  RefVal n -> n
  | _ -> failwith "Expected a reference!"

let rec string_of_expval = function
  |  NumVal n -> "NumVal " ^ string_of_int n
  | BoolVal b -> "BoolVal " ^ string_of_bool b
  | ProcVal (id,body,env) -> "ProcVal ("^id^","^Ast.string_of_expr body^","^ string_of_env env^")"
  | UnitVal -> "UnitVal"
  | RefVal i -> "RefVal ("^string_of_int i^")"
and
  string_of_env  = function
  | EmptyEnv -> ""
  | ExtendEnv(id,v,env) -> "("^id^","^string_of_expval v^")"^string_of_env env
  | ExtendEnvRec(id,param,body,env) -> "("^id^","^param^","^Ast.string_of_expr body^")"^string_of_env env