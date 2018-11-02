(*With Guanqin Zeng*)
let rec take n xs =
  match n, xs with
  | 0,_ -> []
  | n,[] -> []
  | n, (x::xs) -> x::take (n-1) xs

let rec drop n xs =
  match n, xs with
  | 0, xs -> xs
  | n, [] -> []
  | n, (x::xs) -> drop (n-1) xs

let split xs =
  let n = List.length xs in
  (take (n/2) xs, drop (n/2) xs)

type 'a tree = Empty | Node of 'a*'a tree *'a tree

let rec mt f xs =
  match xs with
  | [] -> failwith "Should be non-Empty"
  | [x] -> Node (f x, Empty, Empty)
  | ys -> let (left ,right) = split ys in 
  let Node (v1, lt1, rt1) = mt f left in 
  let Node (v2, lt2, rt2) = mt f right in 
  Node ((f (v1 + v2)), Node (v1, lt1, rt1), Node (v2, lt2, rt2));;
