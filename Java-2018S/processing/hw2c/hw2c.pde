<<<<<<< HEAD
//Jingxuan Ai
float x=-2*PI;

void setup() {
  size(800, 600);
  background(0);
  stroke(255);
  strokeWeight(0);
  frameRate(60);
}
 
void draw() {
  translate(width/2,height/2);
  scale (width/(4*PI),height/2);
  line(x,0,x,sin(x));
  x+=0.01;
  if (x>=2*PI){
    x=-2*PI;
  }
=======
//Jingxuan Ai
float x=-2*PI;

void setup() {
  size(800, 600);
  background(0);
  stroke(255);
  strokeWeight(0);
  frameRate(60);
}
 
void draw() {
  translate(width/2,height/2);
  scale (width/(4*PI),height/2);
  line(x,0,x,sin(x));
  x+=0.01;
  if (x>=2*PI){
    x=-2*PI;
  }
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}