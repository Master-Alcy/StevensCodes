<<<<<<< HEAD
void setup() { 
  size(800, 600);
}

int x = 0, y = 0;
int vx=+2;
void draw() {
  background(0);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  rect(x, y, 100, 100);
  x = x + vx;
  if (x>=800) {
    vx = -vx;
  }
  if (x < 0) {
    vx = -vx;
  }
=======
void setup() { 
  size(800, 600);
}

int x = 0, y = 0;
int vx=+2;
void draw() {
  background(0);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  rect(x, y, 100, 100);
  x = x + vx;
  if (x>=800) {
    vx = -vx;
  }
  if (x < 0) {
    vx = -vx;
  }
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}