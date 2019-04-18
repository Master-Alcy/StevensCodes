type 'a t

val empty_store : int -> 'a -> 'a t

val new_ref : 'a t -> 'a -> int

val deref: 'a t -> int -> 'a

val set_ref : 'a t -> int -> 'a -> unit

val store_to_list:  'a t -> 'a list

