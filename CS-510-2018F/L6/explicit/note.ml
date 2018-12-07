(*IMPLICIT-REFS 1 - 2*)
let s1 ="let g = let count = 0 in  proc (d) {begin set count = count + 1; count end} in (g 11) - (g 22)";;

(*EXPLICIT-REFS 1 - 2*)
let s2 ="let g = let counter = newref (0) in proc (d) {begin setref (counter , deref (counter) + 1); deref (counter) end} in (g 11) - (g 22)";;
(* The set expression is assignment
A begin ... end expression evaluates its subexpressions 
in order and returns the value of the last one. *)
(* set is evalueated to cause an effect (modify the
store/memory), not return a result
Like: x := 1*)
(* value are stored in a store or memory, for our
interpreter we use store *)
(*
set is evaluated to cause an effect on
store/memory. return void.
set is modifying the reference stored 
*)