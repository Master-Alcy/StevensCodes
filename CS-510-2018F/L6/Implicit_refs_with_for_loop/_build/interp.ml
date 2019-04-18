open Ast
open Ds

let from_some = function
  | None -> failwith "from_some: None"
  | Some v -> v
    
let g_store = Store.empty_store 20 (NumVal 0)

let init_env =
  ExtendEnv("i", RefVal (Store.new_ref g_store (NumVal 1)),
   ExtendEnv("v",RefVal (Store.new_ref g_store (NumVal 5)),
    ExtendEnv("x",RefVal (Store.new_ref g_store (NumVal 10)),
      EmptyEnv)))
    
let rec apply_proc f a =
  match f with
    ProcVal (x,b,env) ->
    let l = Store.new_ref g_store a 
    in eval_expr (extend_env env x (RefVal l)) b
  | _ -> failwith "apply_proc: Not a procVal"
and
  eval_expr (en:env) (e:expr) :exp_val =
  match e with
  | Int n          -> NumVal n
  | Var id          ->
    (match apply_env g_store en id with
    | None -> failwith @@ "Variable "^id^" undefined"
    | Some ev -> Store.deref g_store @@ refVal_to_int ev)
  | ITE(e1, e2, e3)    ->
    let v1 = eval_expr en e1 in
    if boolVal_to_bool v1
    then eval_expr en e2
    else eval_expr en e3
  | Add(e1, e2)    ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    NumVal ((numVal_to_num v1) + (numVal_to_num v2))
  | Mul(e1, e2)    ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    NumVal ((numVal_to_num v1) * (numVal_to_num v2))
  | Sub(e1, e2)    ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2  in
    NumVal ((numVal_to_num v1) - (numVal_to_num v2))
  | IsZero(e) ->
    let v1 = eval_expr en e  in
    BoolVal (numVal_to_num v1=0)
  | Let(x, e1, e2) ->
    let v1 = eval_expr en e1
    in let l = Store.new_ref g_store v1 
    in eval_expr (extend_env en x (RefVal l)) e2
  | Proc(x,e)      -> ProcVal (x,e,en)
  | App(e1,e2)     ->
    let v1 = eval_expr en e1 in
    let v2 = eval_expr en e2 in
    apply_proc v1 v2
  | Letrec(id,param,body,e) ->
    eval_expr (ExtendEnvRec(id,param,body,en)) e
  | Set(id,e) ->
    let v=eval_expr en e
    in Store.set_ref g_store
      (refVal_to_int (from_some (apply_env g_store en id))) v;
       UnitVal
  | BeginEnd(es) ->
    List.fold_left (fun v e -> eval_expr en e) (UnitVal) es
  | Debug ->
    (print_string "Environment:\n";
    print_string @@ string_of_env en;
    print_string "\nStore:\n";
    List.iteri (fun i s -> print_string (string_of_int i^"->"
                                                 ^s^"\n")) @@ List.map
      string_of_expval @@ Store.store_to_list g_store;
    UnitVal)

  | For (id,low,high,body) ->
    let v1 = eval_expr en low
    in let l = Store.new_ref g_store v1 
    in eval_for_loop (extend_env en id (RefVal l)) id high body

  | _ -> failwith("Not implemented: "^string_of_expr e)
and
  eval_prog (Ast.AProg e) = eval_expr init_env e
and
  eval_for_loop en id high body =
  let current = numVal_to_num @@ eval_expr en (Var id)
  in if (current <= numVal_to_num (eval_expr en high))
    then 
      begin
        ignore @@ eval_expr en body;
        ignore @@ eval_expr en (Set (id, Add(Var id, Int 1)));
        eval_for_loop en id high body
      end
    else UnitVal



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


let ex2 = "
   let g = 
      let counter = 0 
      in proc(d) {
         begin 
           set counter = counter+1; 
           counter
         end
         }
   in (g 11)-(g 22)"

let ex3 = "
let x = 0
in letrec even(dummy) 
            = if zero?(x)
              then 1 
              else begin 
                    set x = x-1; 
                    (odd 888) 
                   end 
          odd(dummy) 
            = if zero?(x)
              then 0 
              else begin 
                    set x = x-1;
                    (even 888) 
                   end 
   in begin set x = 13; 
            (odd -888) 
      end "
