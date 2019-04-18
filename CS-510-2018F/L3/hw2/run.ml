interp " abs ((-5)) - 6";;

interp " abs (7) - 6";;

interp "cons (1, emptylist)";;

interp "cons ( cons (1, emptylist ), emptylist )";;

interp "let x = 4 in cons (x, cons (cons (x-1, emptylist), emptylist))";;

interp "null?(emptylist)";;

interp "null?(tl(cons(cons(1,emptylist),emptylist )))";;

interp "tl(cons(cons(1,emptylist),emptylist))";;

interp "cons(cons(1,emptylist),emptylist)";;

interp "hd(cons(1,cons(2,cons(3,emptylist))))";;

interp "tl(cons(1,cons(2,cons(3,emptylist))))";;