

(* Algebraic Data Types *)

type dow =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

let next = function
  | Monday -> Tuesday
  | Tuesday -> Wednesday
  | Wednesday -> Thursday
  | Thursday -> Friday
  | Friday -> Saturday
  | Saturday -> Sunday
  | Sunday -> Monday

let is_weekend = function
  | Saturday | Sunday -> true
  | _ -> false

(* Polymorphic Binary Trees *)
    
type 'a bt = Empty | Node of 'a * 'a bt * 'a bt

let t1 =
  Node(7,
       Node(4,Empty,Empty),
       Node(12,
            Node(10,Empty,Empty),
            Empty))

let rec size_t = function
  | Empty -> 0
  | Node(i,lt,rt) -> 1+size_t lt + size_t rt

let rec sum_t = function
  | Empty -> 0
  | Node(i,lt,rt) -> i + sum_t lt + sum_t rt

let rec inc_t = function
  | Empty -> Empty
  | Node(i,lt,rt) -> Node(i+1,inc_t lt,inc_t rt)

let rec map_t f = function
  | Empty -> Empty
  | Node(i,lt,rt) -> Node(f i, map_t f lt, map_t f rt)


let rec fold_t a f = function
  | Empty -> a
  | Node(i,lt,rt) -> f i (fold_t a f lt) (fold_t a f rt)

let rec max_t = function
  | Empty -> failwith ("max_t: empty tree")
  | Node(i,Empty,Empty) -> i
  | Node(i,Empty,rt) -> max i (max_t rt)
  | Node(i,lt,Empty) -> max i (max_t lt)
  | Node(i,lt,rt) -> max i (max (max_t lt) (max_t rt))


(* Non-Empty General trees *)

type 'a gt = Node of 'a * ('a gt) list

let t2 = Node(7,[Node(5,[]);Node(6,[]);Node(8,[])])
    
let rec map_gt f = function
  | Node(i,sts) -> Node(f i, List.map (map_gt f) sts)

let rec fold_gt f = function
  | Node(i,sts) -> f i (List.map (fold_gt f) sts)

(* Mini-Logo *)

type dir = North | East | South | West

type command = Move of dir | PenUp | PenDown

type program = Empty | Seq of command * program

let p = Seq(PenDown,
            Seq(Move North,
                Seq(Move East,
                    Seq(Move South,
                        Seq(Move West,
                            Seq(PenUp,Empty))))))

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
              
       
