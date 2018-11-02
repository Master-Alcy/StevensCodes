//Jingxuan Ai 2018/1/26
void setup() { 
  size(800, 600);
}

float x = 50f, y = 50f;
float vx=0f;
float vy=0f;

void draw() {
  background(0);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(3);

  ellipse(x, y, 100, 100);
  x = x + vx;
  y = y + vy;
  if (x<width-50 && y==50) {
    vx=4f;
    vy=0;
  }
  if (x==width-50 && y<height-50) {
    vx=0;
    vy=4f;
  }
  if (x>50 && y==height-50) {
    vx=-4f;
    vy=0;
  }
  if (x==50 && y>50) {
    vx=0;
    vy=-4f;
  }
}