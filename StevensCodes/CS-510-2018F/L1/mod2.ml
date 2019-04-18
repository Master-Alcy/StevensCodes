let id x = x;;
(*id is a function that given a 
value of type 'a, returns another 
value of the same type 'a*)
id 2;;
id true;;
id "hello";;
let f x = 7;;
let fst (x,y) = x;;
fst (2,3);;
let f x y = x;;
f 1 2;;
let twice f x = f (f x);;
let sqr x = x * x;;
twice sqr 2;;
(*A function that takes another function as
argument or that returns a function as result*)
let add x y = x + y;;
let myAnd x y = x && y;;
let apply f x = f x;;
apply (fun x -> (x,x)) 3;;
let compose f g x = f (g x);;
compose sqr sqr 2;;

print_string "\n---------------------\n";;
[1;2;3];;
["he";"llo"];;
1 :: [2;3];;
[];;
1::2::3::[];;
(*:: adds an element to the beginning of a list*)
[1;2;3] @ [4;5];; 
(*@ for append, which combined two lists*)
List.length [1;1;2;3];;
open List;;     (*open modules to use later*)
length [1;2;3];;

print_string "\n---------------------\n";;
let rec sum n =
match n with 
|0 -> 0
|n when n>0 -> n + sum(n-1)
|_ -> failwith "Must be non-negative";;
sum 0;;
sum 10;;
(*sum ~-3;;8*)
(*rec: define recursive funcion
match is pattern matching on n*)
let rec fact n =
match n with
| 0 -> 1
| n when n>0 -> n * fact (n-1)
| _-> failwith "Must be non-negative";;
fact 0;;
fact 10;;
(*fact (-3);;*)

print_string "\n---------------------\n";;
let rec length (l:'a list) : int =
match l with
|[] -> 0
|(x :: xs) -> 1 + length xs;;
(*x::xs called the inductive(归纳) case*)

let rec sum l = 
match l with
| [] -> 0
| x::xs -> x + sum xs;;

let rec incr (l:'a list) : ('b list) =
match l with
| [] -> []
| x::xs -> x + 1 :: incr xs;;

let rec stutter (l:'a list) : ('b list) =
match l with 
| [] -> []
| x :: xs -> x :: x :: stutter xs;;

let rec even (l:'a list) : 'b list =
match l with
| [] -> []
| (x :: xs) -> 
if (x mod 2=0) 
then x :: even xs
else even xs;;

(*head, tail, maximum, last, remove_adjacents*)