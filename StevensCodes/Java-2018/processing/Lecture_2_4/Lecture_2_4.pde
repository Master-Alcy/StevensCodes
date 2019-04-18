<<<<<<< HEAD
//recursive functions need 2 things
//1. fuction must call itsel
//2. it must end somehow (termination condition)

/*
5! = 5*4!;
...
1!=1*0!; = 1*1=1
*/
double factorial(int n){
  if (n==1)
  return 1;
  return n*factorial(n-1);
}

//double count(int n){

void setup(){
  println(factorial(5));
=======
//recursive functions need 2 things
//1. fuction must call itsel
//2. it must end somehow (termination condition)

/*
5! = 5*4!;
...
1!=1*0!; = 1*1=1
*/
double factorial(int n){
  if (n==1)
  return 1;
  return n*factorial(n-1);
}

//double count(int n){

void setup(){
  println(factorial(5));
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}