(*Exercise 1*)
print_string "\n----------------Exercise 1---------------\n\n";;

let seven (x: 'a):int = 7;;

print_string "negative value need to be expressed as ~-x or (-x)";;
let sign (x: int):int = 
  if x > 0 then 1 else
  if x == 0 then 0 else -1 ;;

let absolute (x: int):int =
  if x < 0 then -x else x;;

print_string "Ex: andp (true) (1>2);;";;
let andp (x:bool) (y:bool):bool =
  if x = true && y = true
  then true else false;;

let orp (x:bool) (y:bool):bool =
  if x = true || y = true
  then true else false;;

let notp (x:bool):bool =
  if x = true then false else true;;

let xorp (x:bool) (y:bool):bool =
  if x = true && y = false
  then true else
  if x = false && y = true
  then true else false;;

print_string "Assuming x and y are both int.";;
let dividesBy (x:int) (y:int) :bool =
  if y = 0 then failwith "Denominator can't be zero." else
  if (x mod y) = 0
  then true else false;;

let is_singleton (xs:'a list): bool = 
  match xs with
  | [] -> false
  | a :: [] -> true
  | a :: b :: rest -> false;;

let swap ((x :'a), (y:'b)) : ('b * 'a) = (y, x);;

let app (f : 'a -> 'b) (x: 'a) : 'b = f x;;

let twice (f: 'a -> 'a) (x:'a) : 'a = f (f x);;

let compose (f:'b -> 'c) (g : 'a->'b) (x:'a) : 'c= f(g x);;

(*Exercise 2*)
print_string "\n----------------Exercise 2---------------\n\n";;

let rec union_ext (l1:'a list) (l2:'a list) : 'a list = 
  match l1 with
  | [] -> l2
  | x :: xs ->
    if List.mem x l2
    then union_ext xs l2
    else x :: union_ext xs l2;;

let rec intersection_ext (l1:'a list) (l2:'a list) : 'a list = 
  match l1 with
  | [] -> []
  | x :: xs ->
    if List.mem x l2
    then x :: intersection_ext xs l2
    else intersection_ext xs l2;;

(*'a list -> 'a -> bool*)
let belongsTo_ext (l1:'a list) (x:'a) : bool = 
  if List.mem x l1
  then true
  else false;;

let union_char (x: 'a) (c1: 'a -> bool) (c2: 'a -> bool) : bool = c1 x || c2 x;;

let intersection_char (x: 'a) (c1: 'a -> bool) (c2: 'a -> bool) : bool = c1 x && c2 x;;

(* belongs to ('a -> bool) -> 'a -> bool *)
(* belong_to S x = S x  *)
(*(fun x -> x = 1) *)
let belongsTo_char (c1: 'a -> bool) (x: 'a) : bool = c1 x;;

let rec remAdjDups (ls: 'a list) : 'a list =
  match ls with
  | [] -> []
  | x :: [] -> x :: []
  | x :: y :: rest ->
    if x = y
    then remAdjDups (y :: rest) 
    else x :: remAdjDups (y :: rest);;

let rec sublists (ls: 'a list) : ('a list list) =
  match ls with
  | [] -> [[]]
  | x :: xs ->
    (sublists xs) @ List.map (fun xss -> x :: xss) (sublists xs);;

(*Exercise 3*)
print_string "\n----------------Exercise 3---------------\n\n";;

type calcExp =
  | Const of int
  | Add of ( calcExp * calcExp )
  | Sub of ( calcExp * calcExp )
  | Mult of ( calcExp * calcExp )
  | Div of ( calcExp * calcExp );;

let e1 = Const (2);;
let e2 = Add ( Sub ( Const (2) , Const (3)) , Const (4));; (*3*)
let e3 = Add (Div (Mult (Add ( Sub ( Const (2) , Const (3)), Const (4)), Const(2)), Const(3)   ), Const (9));; (*11*)
let e4 = Add ( Add ( Add ( Const (2) , Const (3)) , Const (4)), Const (5));;
let succ i = i + 1;;

let rec mapC fn calc =
  match calc with
  | Const x -> Const (fn x)
  | Add (e1, e2) -> Add (mapC fn e1, mapC fn e2)
  | Sub (e1, e2) -> Sub (mapC fn e1, mapC fn e2)
  | Mult (e1, e2) -> Mult (mapC fn e1, mapC fn e2)
  | Div (e1, e2) -> Div (mapC fn e1, mapC fn e2);;

(*fn acc calc -> acc + calc
  what fn do is adding results together*)

let rec foldC fConst fAdd fSub fMult fDiv exp =
  match exp with
  | Const x -> fConst x
  | Add (e1, e2) -> fAdd (foldC fConst fAdd fSub fMult fDiv e1) (foldC fConst fAdd fSub fMult fDiv e2)
  | Sub (e1, e2) -> fSub (foldC fConst fAdd fSub fMult fDiv e1) (foldC fConst fAdd fSub fMult fDiv e2)
  | Mult (e1, e2) -> fMult (foldC fConst fAdd fSub fMult fDiv e1) (foldC fConst fAdd fSub fMult fDiv e2)
  | Div (e1, e2) -> fDiv (foldC fConst fAdd fSub fMult fDiv e1) (foldC fConst fAdd fSub fMult fDiv e2);;

let numAdd exp = foldC
    (fun x -> 0) 
    (fun a b -> a + b + 1) 
    (fun a b -> a + b) 
    (fun a b -> a + b) 
    (fun a b -> a + b) 
    exp;;

let replaceAddWithMult exp = foldC 
    (fun x -> Const x) 
    (fun a b -> Mult (a, b)) 
    (fun a b -> Sub (a, b)) 
    (fun a b -> Mult (a, b)) 
    (fun a b -> Div (a, b)) 
    exp;;

let rec evalC calc =
  match calc with
  | Const x -> x
  | Add (e1, e2) -> evalC e1 + evalC e2
  | Sub (e1, e2) -> evalC e1 - evalC e2
  | Mult (e1, e2) -> evalC e1 * evalC e2
  | Div (e1, e2) -> evalC e1 / evalC e2;;

let evalCf exp = foldC 
    (fun x -> x) 
    (fun a b -> a + b) 
    (fun a b -> a - b) 
    (fun a b -> a * b) 
    (fun a b -> a / b) 
    exp;;

(*Exercise 4*)
print_string "\n----------------Exercise 4---------------\n\n";;

let f1 xs =
  let g1 = fun x r -> 
    if x mod 2 = 0  (*if x is even*)
    then r + 1      (*increase r by 1*)
    else r          (*don't change r*)
  in List.fold_right g1 xs 0;;

print_string "This function counts the number of even numbers in a list";;
f1 [2;3;4];;
f1 [1;2;3;4;5;6;7;8;9];;

let append xs = 
  let g = fun x h -> 
    x :: h
  in List.fold_right g xs;;