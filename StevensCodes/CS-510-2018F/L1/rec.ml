(* Basic examples of recursion on lists *)

let rec sum xs =
  match xs with
  | [] -> 0
  | x::xs -> x + sum xs

(* abbreviated version of previous function *)
               
let rec sum'  = function
  | [] -> 0
  | x::xs -> x + sum' xs

let rec mem x = function
  | [] -> false
  | y::ys -> x=y || mem x ys

(* underscore pattern *)
let rec f xs =
  match xs with
  | [] -> true
  | _ -> false

(* nested patterns *)
let rec g = function
  | [] -> []
  | [x] -> [x]
  | x::y::xs ->
    if x=y
    then
      g (y::xs)
    else
      x:: g (y::xs)