void setup() {
  println("hello");
  println(2 + 3);         // int is 32 bits = 4.2e-9
  println(7 * 24);
  println(75 * 365 * 24 * 60 * 60);  //overflow
  println(150 * 365 * 24 * 60 * 60);  //overflow
  println(24 * 60 * 60);
  println(24 * 60 * 60 * 365);
  
  int seconds = 75 * 365 * 24 * 60 * 60; //overflow
  println(seconds);
  long bigSeconds = 75 * 365 * 24 * 60 * 60; //still overflow
  println(bigSeconds);
  long bigSeconds2 = 75L * 365L * 24L * 60L * 60L;
  println(bigSeconds2);
  long bigSeconds3 = 75L * 365 * 24 * 60 * 60; //type promotion, 365->365L
  println(bigSeconds3);
  
  exit();
}