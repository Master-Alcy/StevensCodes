let s1 = "let f = proc (x) { x-11 } in (f (f 77))";; 

let s11 = "(proc (f) { (f (f 77)) } proc (x) { x-11 })";;
let s12 = "(proc (y) { (y (y 77)) } proc (x) { x-11 })";;

let s2 = "let x = 200 in let f = proc (z) { z-x } in (f 1)";;

let s3 = "let x = 200 in let f = proc (z) { z-x } in let x = 100 in let g = proc (z) { z-x } in (f 1) - (g 1)";;

let s4 = "let f = proc (x) {x-11} in (f (f 77))";;   

let s5 = AProg (Let ("f", Proc ("x", Sub ( Var "x", Int 11)),App (Var "f", App (Var "f", Int 77) )));;

let s6 = "let x = 200 in let f = proc (z) { z-x } in let x = 100 in let g = proc (z) { z-x } in (f 1) - (g 1)";;

let ss1 ="
let even = proc (e) { proc (o) { proc (x) {
    if zero?(x)
    then zero?(0)
    else (((o e) o) (x-1))
}}} in
let odd = proc (e) { proc (o) { proc (x) {
    if zero?(x)
    then zero?(1)
    else (((e e) o) (x-1))
}}} in
(((even even) odd) 4)
";;
