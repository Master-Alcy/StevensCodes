print_string "\n--------------------\n";;
1;;
1+1;;
4-1;;
13/3;;
(*dot after operator*)
13.0/.3.0;;
30_000_000/300_000;;
3.5 +. 6.;;
sqrt 9.;;
float_of_int 2;;
int_of_float 5.5;;

print_string "\n--------------------\n";;
'a';;
"Hello.";;
(*string.[charat]*)
"Hello".[1];; 
Char.uppercase 'z';;
Char.uppercase '[';;
Char.chr 97;;
Char.code 'a';;
"Hello " ^ "world";;
"The character '\000 ' is not a terminator ";;
"\072\105";;
String.length "Ab\000cd";;
(*sub "string" start_index length*)
String.sub "abcdefghi" 1 3;;
String.sub "abcdefghi" 1 4;;
String.sub "abcdefghi" 2 6;;

print_string "\n--------------------\n";;
2 < 4;;
"A good job" > "All the tea in China";;
(*'='for '=='in java*)
2+6=8;;
1.0=1.0;;
2!=2;;
true && false;;
true || false;;
if 1 < 2 then 3 + 7 else 4;;
if 3 != 4 then 1 else 2;;

print_string "\n--------------------\n";;
();;
print_string "Test print_string.";;
print_char 'a';;
print_int 999;;
print_string "Hello "; print_string "bye";;

print_string "\n--------------------\n";;
(*variable name start with lowercase
allow re-use, let identifier = expression*)
let x = 1
let y = 2
let z = x + y;;
(*declarations can be nested :
let variable = expression in expression*)
let z =
    let x = 10 in
    let y = 20 in
    x + y;;
let x = 8;;
let z = 88;;
let z =
    let y = 100 in (*here give y to z in next equation*)
    y in x + 11 + z;;
x;; y;; z;;

print_string "\n--------------------\n";;
let succ i = i + 1;;
succ 1;;
succ(succ(succ 1));;
succ;;
(*like in js, we can also use anonymous functions*)
let succ2 = fun i -> i + 3;;
succ2(succ2(succ2 10));;
fun x -> x * x;;
let f i = i > 0;;
f 3;;
let add i j = i + j;;
add 2 3;;
let add2 = fun i j -> i + j;;
add2 4 5;;
(*succ is a function that
given an integer i,
returns a function that
given an integer j,
returns i + j*)
add 1;;
let succ3 = add 1;;
succ3 4;;

print_string "\n--------------------\n";;
(2,3);;
(true, 4);;
(false, 1, 2);;
(2, (true, 23));;
let fst (x,y) = x;;
fst (2,3);;
(*(x,y) is a pattern that can
only match a pair*)
let f2 (x,_) = x;;
f2 (2,3);;

print_string "\n--------------------\n";;
type db_entry = {
    name : string ;
    height : float ;
    phone : string ;
    salary : float ;
};;
let jason ={ 
    name = " Jason "; 
    height = 6.25;
    phone = " 626 -555 -1212 "; 
    salary = 50.0; 
};;
jason.height;;
let {name = n; height = h} = jason;;
let dave = {jason with name = "Dave";
height = 5.9};;
jason;;

print_string "\n--------------------\n";;
type db_entry2 = { 
    name : string ; 
    height : float ; 
    phone : string ; 
    mutable salary : float ;
};;
let john = {
   name = " John "; 
   height = 5.3; 
   phone = "123 -456 -7890 "; 
   salary = 150.0
};;
john.salary <- 150.0;;
john;;
let dave = {
    name = "Dave";
    height = 6.25;
    phone = "626-111-1111";
    salary = 150.0;
};;
dave.salary <- 180.0;;
dave;;
jason;;