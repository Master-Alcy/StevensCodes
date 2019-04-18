print_string "\n-------------unions-----------\n";;
print_string "------Algebraic Data Types-------\n\n";;
type dow =
| Monday
| Tuesday
| Wednesday
| Thursday
| Friday
| Saturday
| Sunday ;;
Monday;;

let is_weekend1 d = 
match d with
| Saturday -> true
| Sunday -> true
| _ -> false;;
let is_weekend2 d = 
match d with
| Saturday | Sunday -> true
| _ -> false;;
let is_weekend3 = function
| Saturday | Sunday -> true
| _ -> false;;
let next_day1 = function
| Monday -> Tuesday
| Tuesday -> Wednesday
| Wednesday -> Thursday
| Thursday -> Friday
| Friday -> Saturday
| Saturday -> Sunday
| Sunday -> Monday ;;
next_day1 Sunday;;
let next_day2 d =
match d with
| Monday -> Tuesday
| Tuesday -> Wednesday
| Wednesday -> Thursday
| Thursday -> Friday
| Friday -> Saturday
| Saturday -> Sunday
| Sunday -> Monday ;;

type course =
| UGrad of string * int * (dow list ) 
(* name , enrollment ,schedule *)
| Grad of string * int * ( dow list );;
UGrad ("data structures", 23, [Monday; Wednesday]);;

let get_name1 = function
| UGrad(name,_,_) | Grad(name,_,_) -> name;;
let get_name2 c =
match c with
| UGrad (name ,_,_) | Grad (name ,_,_) -> name;;
get_name1 (UGrad ("data structures", 23, [Monday; Wednesday])) ;;

let rec scheduled_days cs =
match cs with
| [] -> []
| c :: cs' -> ((*get_scheduled*) c) @ (scheduled_days cs');;