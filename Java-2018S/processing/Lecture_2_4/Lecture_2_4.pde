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
}