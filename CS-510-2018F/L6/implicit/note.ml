type counter = {
    get: unit -> int;
    set: int -> unit;
    inc: unit -> unit
};;

let c =
let s = ref 0 in {
    get = (fun () -> !s);
    set = (fun x -> s:=x);
    inc = (fun() -> s:=!s+1)
};;

let newCounter n =
let s = ref n in
let rec this = {
    get = (fun () -> !s);
    set = (fun x -> s:=x);
    inc = (fun () -> s:= this .get () +1)
} in this;;

type node = {
    data: int;
    mutable next: (node ref) option
};;

type llist = {
    mutable head: (node ref) option;
    mutable size: int
};;

let create() = {
    head = None;
    size = 0
}

let add (x: int) (ll:llist) : llist = 
    ll.head <- Some (ref {
        data = x;
        next = ll.head
    });
    ll.size <- ll.size + 1;
    ll;;

let string_of_list ll =
    let rec string_of_node = function
    | None -> ""
    | Some r -> string_of_node (!r.next) ^
                string_of_int (!r.data)
    in string_of_node (ll.head);;
(*
get (i:int)(l:llist): int
append (l1:llist)(l2:llist): llist
is_circular (l:llist): bool
binary trees
*)
let a = [|1;2;3|];;
a.(1);;
a.(1) <- 4;;
a;;
(*
set is evaluated to cause an effect on
store/memory. return void.
set is modifying the reference stored 
*)
(*
Call-by-value implemented in implicit refs
maybe implementing call-by-reference
Call-by-value:
    a new location is created for every evaluation of an operand
Call-by-reference:
    a new location is created for every evaluation of an operand
other than a variable.
*)