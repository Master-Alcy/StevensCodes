(*Map, Filter, Iter, Fold*)
print_string "\n---------Map-------------\n\n";;
let rec succl (l:int list) : int list =
match l with
| [] -> []
| x::rest -> x + 1 :: succl rest;;

let rec to_upperl (l:char list) : char list =
match l with
| [] -> []
| x :: rest -> Char.uppercase x :: to_upperl rest;;

let rec all_zero (l: int list) : bool list =
match l with 
| [] -> []
| x :: rest -> (x = 0) :: all_zero rest;;

let rec map (f:'a) (l:'b) =
match l with
| [] -> []
| x::rest -> f x :: map f rest;;

let succl' = map (fun x -> x + 1);;
let to_upper' = map Char.uppercase;;
let all_zero = map (fun x -> x = 0);;

print_string "\n-----------Filter-----------\n\n";;
let rec greater_than_zero (l:int list) : int list =
match l with
| [] -> []
| x :: rest ->
if x > 0
then x :: greater_than_zero rest
else greater_than_zero rest;;

let rec uppercase (l:char list) : char list =
match l with
| [] -> []
| x :: rest ->
if Char.uppercase x = x
then x :: uppercase rest
else uppercase rest;;

let rec non_empty (l:'a list list) : 'a list list =
match l with
| [] -> []
| x :: rest ->
if x != []
then x :: non_empty rest
else non_empty rest;;

(*('a -> bool) -> 'a list -> 'a list*)
let rec filter (p: ('a -> bool)) (l: 'a list) : 'a list =
match l with
| [] -> []
| x :: rest ->
if p x
then x :: filter p rest
else filter p rest;;

let greater_than_zero' = filter ( fun x -> x >0);;
let uppercase' = filter (fun x -> x= Char . uppercase x);;
let non_empty' = filter (fun x -> x !=[]);;
(*this use is like:
'let something = filter p ;;'
we input 'something list' later to
fullfill 'filter p l' *)

print_string "\n-----------Iterate-----------\n\n";;
let rec print_list_of_strings l =
match l with
| [] -> ()
| x :: rest -> print_string x;
print_list_of_strings rest;;

List.iter print_string ["Hello\n"; "Test\n"; "String\n"];;

print_string "\n-----------Fold-----------\n\n";;
let rec sum_list (l:int list) : int =
match l with
| [] -> 0
| x :: rest -> x + sum_list rest;;

let rec and_list (l: bool list) : bool =
match l with
| [] -> true
| x :: rest -> x && and_list rest;;

let rec flatten (l: 'a list list): 'a list =
match l with
| [] -> []
| x :: rest -> x @ flatten rest;;

let rec fold_right func acc lis =
match lis with
| [] -> acc
| x :: rest -> fold_right func (func acc x) rest;;

let rec fold_left func acc lis =
match lis with
| [] -> acc
| x :: rest -> func x (fold_left func acc rest);;

let rec take index lis =
match index, lis with
| 0, lis -> []
| n, [] -> []
| n, (x :: rest) -> x :: take (n-1) rest;;

let sumL (xs :int list) : int =
fold_left (fun acc x -> acc + x) 0 xs;;
let concatL (xs : string list) : string =
fold_left (fun acc x -> acc ^ x) "" xs;;
(*the expression List.fold_left 
f b [x1; x2; ...; xn] evaluates to 
f (... (f (f b x1) x2) ...) xn.
'Left' means traverses from left to right*)
let concatR (xs : string list) : string =
fold_right (fun x acc -> x ^ acc) "" xs;;
(*List.fold_right 
f [x1; x2; ...; xn] b 
evaluates to 
f x1 (f x2 (... (f xn b)...)) *)
let sumS = List.fold_left (+) 0;;
let concatS = List.fold_left (^) "";;
(*(+) and (^) are shorcut for long function*)
let lengthS l = List.fold_left (fun a _ -> a + 1) 0 l;;
let revS l = List.fold_left (fun a x -> x :: a) [] l;;
let mapS f l = List.fold_right (fun x a -> (f x) :: a) l [];;
let mapS' f l = List.fold_left (fun a x -> (f x) :: a) [] (List.rev l);;
let appS f l = List.fold_left (fun _ x -> f x) () l;;
let filterS f l = List.fold_right (fun x a -> if f x then x :: a else a) l [];;
(*Note that fold.left is tail recursive and also in better
performance than fold.right. To use fold.right we can reverse
the list before applying to use fold.left instead.*)