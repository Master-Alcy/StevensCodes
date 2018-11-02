(**Node type *)
type 'a node = {
    data: 'a;
    next: 'a node ref option
}

let new_node item nextn = ref {
    data = item;
    next = nextn
}

(**Linked List type *)
type 'a ll = {
    head: 'a node ref option;
    size: int
}

(**create an empty linked list *)
let new_ll (): 'a ll={
    head = None; 
    size = 0
}

(**add item at the beginning of the linked list *)
let add (item:'a) (ll: 'a ll):('a ll) = {
    head = Some (new_node item (ll.head));
    size = ll.size +1
}

let rec string_of_ll_helper (toString:'a -> string) ornode acc =
match ornode with
| None -> acc
| Some node_ref -> let node = !node_ref in
string_of_ll_helper toString (node.next) (acc^toString (node.data))

let string_of_ll (toString:'a -> string) ll = 
string_of_ll_helper toString ll.head
