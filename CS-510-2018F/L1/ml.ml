
(* type synonym for better readiability *)
type program = int list
    
let simple_program : program = [0; 2; 3; 4; 5; 1]

let next ((x,y):int*int):int -> int*int = function
  | 2 -> (x,y+1)
  | 3 -> (x+1,y)
  | 4 -> (x,y-1)
  | 5 -> (x-1,y)
  | _ -> (x,y)
         
let rec coverage ((x,y):int*int) (p:program):(int*int) list =
  match p with
  | [] -> [(x,y)]
  | c::cs -> (x,y):: coverage (next (x,y) c) cs 

let opposite (c:int): int =
  match c with
  | 2 -> 4
  | 3 -> 5
  | 4 -> 2
  | 5 -> 3
  | _ -> c
    
let rec mirror_image (p:program):program =
  match p with
  | [] -> []
  | c::cs -> opposite c:: mirror_image cs

let rec repeat i x =
  match i with
  | 0 -> []
  | n -> x::repeat (n-1) x
           
let rec pantograph (p:program) (factor:int):program =
  match p with
  | [] -> []
  | c::cs when c=1 || c=0 -> c:: pantograph cs factor
  | c::cs -> repeat factor c @ pantograph cs factor

let compress (p:program) =
  let rec compress' (i:int) (p:program) =
    match p with
    | [] -> []
    | [c] -> [(c,i)]
    | c1::c2::cs ->
      if c1=c2
      then compress' (i+1) (c2::cs)
      else (c1,i)::compress' 1 (c2::cs)
  in compress' 1 p

(* An example of mutual recursion *)

let rec even = function
  | 0 -> true
  | n -> odd (n-1)
and
  odd = function
  | 0 -> false
  | n -> even (n-1)
