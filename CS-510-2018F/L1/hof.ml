let my_succ x = x+1;;
let my_upper c = Char.uppercase c;; (*uppercase_ascii*)
let my_iszero x = x=0;;
                  
let rec succl (xs:int list): int list =
  match xs with
  | [] -> []
  | y::ys -> my_succ y :: succl ys;;
  
let rec to_upperl (xs:char list): char list =
  match xs with
  | [] -> []
  | y::ys -> my_upper  y :: to_upperl ys;;
  
let rec all_zero (xs:int list):bool list =
  match xs with
  | [] -> []
  | y::ys -> my_iszero y  :: all_zero ys;;

(* ( 'a -> 'b  )   ->  'a list  -> 'b list      *)
let rec map f xs =
  match xs with
  | [] -> []
  | y::ys -> f y :: map f ys;;


let rec greater_than_zero (xs:int list):int list =
  match xs with
  | [] -> []
  | y::ys ->
    if y>0
    then y::greater_than_zero ys
    else greater_than_zero ys;;

let rec uppercase (xs:char list): char list =
  match xs with
  | [] -> []
  | y::ys ->
    if Char.uppercase y = y  (*uppercase_ascii*)
    then y::uppercase ys
    else uppercase ys;;


let rec non_empty (xs:'a list list):'a list list =
  match xs with
  | [] -> []
  | y::ys ->
    if y != []
    then y::non_empty ys
    else non_empty ys;;

(*  (  'a -> bool )    ->  'a list   ->  'a list  *)
let rec filter p xs =
  match xs with
  | [] -> []
  | y::ys ->
    if p y
    then y::filter p ys
    else filter p ys


let rec sum_list (xs: int list): int =
  match xs with
  | [] -> 0
  | y::ys -> y + sum_list ys
               

let rec and_list (xs: bool list): bool =
  match xs with
  | [] -> true
  | y::ys -> y && and_list ys
  

let rec flatten (xs:'a list list):'a list =
  match xs with
  | [] -> []
  | y::ys -> y @ flatten ys

(*  ( 'a  ->  'b -> 'b )   ->   'b ->  'a list ->  'b   *)
let rec fold_left f a xs =
  match xs with
  | [] -> a
  | y::ys -> f y (fold_left f a ys)

let rec take n xs =
  match n,xs with
  | 0,xs -> []
  | n,[] ->[]
  | n,(y::ys) -> y::take (n-1) ys

let rec fold_right f a xs =
  match xs with
  | [] -> a
  | y::ys -> fold_right f (f a y) ys
    
