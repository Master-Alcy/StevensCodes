print_string "\n-------Binary Tree of Integers-------------\n";;

type treei =
  | Empty
  | Node of int * treei * treei;;

Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty));;

let rec size t =
  match t with
  | Empty -> 0
  | Node(i, left, right) -> i + size left + size right;;

(*Note that treei must be wrapped with ()*)
size (Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty)));;

type 'a tree = 
  | Empty
  | Node of 'a * 'a tree * 'a tree;;

Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty));;
Node("hello",Node("bye",Empty ,Empty),Node("hey",Empty ,Empty));;
Node(true ,Node(false ,Empty ,Empty),Node(true ,Empty ,Empty));;

let t1 =
  Node(7,
       Node(4,Empty,Empty),
       Node(12,
            Node(10,Empty,Empty),
            Empty));;

let rec size_t = function
  | Empty -> 0
  | Node (x, left, right) -> 1 + size_t left + size_t right;;

let rec sum_t = function
  | Empty -> 0
  | Node(i,lt, rt) -> i + sum_t lt + sum_t rt;;

let rec increase_t = function
  | Empty -> Empty
  | Node(i,lt,rt) -> Node(i + 1, increase_t lt, increase_t rt);;

let rec map_t f = function
  | Empty -> Empty
  | Node (i, lt, rt) -> 
    Node (f i, map_t f lt, map_t f rt);;

let rec fold_t a f t =
match t with
  | Empty -> a
  | Node(i,lt,rt) ->
    f i (fold_t a f lt) (fold_t a f rt);;

fold_t Empty (fun i lt rt -> Node(i+1,lt,rt)) t1;;

let rec max_t = function
  | Empty -> failwith ("max_t: empty tree")
  | Node(i, Empty, Empty) -> i
  | Node(i, Empty, rt) -> max i (max_t rt)
  | Node(i, lt, Empty) -> max i (max_t lt)
  | Node(i, lt, rt) -> max i (max (max_t lt) (max_t rt));;

(*Non-Empty General trees*)
type 'a gt = Node of 'a * ('a gt) list;;

let t2 = Node(7, [Node(5,[]); 
                  Node(6,[]); 
                  Node(8,[])]);;

let rec map_gt f = function
  | Node(i, sts) ->
    Node (f i, List.map (map_gt f) sts);;

let rec fold_gt f = function
  | Node (i, sts) -> 
    f i (List.map (fold_gt f) sts);;

(*Mini-Logo*)
type dir = North | East | South | West;;
type command = Move of dir | PenUp | PenDown;;
type program = Empty | Seq of command * program;;

let p = Seq(PenDown,
            Seq(Move North,
                Seq(Move East,
                    Seq(Move South,
                        Seq(Move West,
                            Seq(PenUp,Empty))))));;

let fold_dir a b c d = function
  | North -> a
  | East -> b
  | South -> c
  | West -> d
    
let fold_cmd f a b = function
  | Move(d) -> f d
  | PenUp -> a
  | PenDown -> b

let rec fold_p f a = function
  | Empty -> a
  | Seq(c,cs) -> f c (fold_p f a cs)

(*For all fold functions: 
fun acc x -> acc + x*)
let rec fold_left1 fn acc exp = 
  match exp with
  | [] -> acc
  | x :: xs -> fold_left1 fn (fn acc x) xs;;

let rec fold_right1 fn exp acc = 
  match exp with
  | [] -> acc
  | x :: xs -> fn x (fold_right1 fn xs acc);;

let rec map (f:'a) (l:'b) =
  match l with
  | [] -> []
  | x::rest -> f x :: map f rest;;

let succ i = i + 1;;
