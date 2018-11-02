<<<<<<< HEAD
void setup() { 
  size(600, 600);
}

byte x = 0, y = 0;
void draw() {
  background(0);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  rect(x, y, 100, 100);
  x = (byte)(x + 1);
=======
void setup() { 
  size(600, 600);
}

byte x = 0, y = 0;
void draw() {
  background(0);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  rect(x, y, 100, 100);
  x = (byte)(x + 1);
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}