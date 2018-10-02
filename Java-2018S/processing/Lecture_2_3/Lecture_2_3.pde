<<<<<<< HEAD
// f(x)=x+x
int f(int x) {
  return x*x;
}
int g(double a){
  return (int)a;
}
double h(double a, double b){
  return a < b ? a : b;
}
float hypotenuse(float a, float b){
  return sqrt(a*a+b*b);
}
double factorial(int n){
  double x=1;
  for (int i=1;i>=1;i--){
    x*=i;
  }
  return x;
}

void setup(){
  println(f(3));
  for (int i=0;i<5;i++){
    print(f(i));
  }
  println();
  println(g(5.2));
  println(h(1.2,2.3));
  
  float c = hypotenuse(3.0,4.0); //sqrt()
  double f = factorial(5); //5!=120.0
  println(factorial(20));
  //println(findEps()); //
  exit();
=======
// f(x)=x+x
int f(int x) {
  return x*x;
}
int g(double a){
  return (int)a;
}
double h(double a, double b){
  return a < b ? a : b;
}
float hypotenuse(float a, float b){
  return sqrt(a*a+b*b);
}
double factorial(int n){
  double x=1;
  for (int i=1;i>=1;i--){
    x*=i;
  }
  return x;
}

void setup(){
  println(f(3));
  for (int i=0;i<5;i++){
    print(f(i));
  }
  println();
  println(g(5.2));
  println(h(1.2,2.3));
  
  float c = hypotenuse(3.0,4.0); //sqrt()
  double f = factorial(5); //5!=120.0
  println(factorial(20));
  //println(findEps()); //
  exit();
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}