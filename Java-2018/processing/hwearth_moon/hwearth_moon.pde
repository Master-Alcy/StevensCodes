<<<<<<< HEAD
PShape earth;
PShape moon;

void setup() {
  size(800,800,P3D);
  PImage img1 = loadImage("earth.jpg");
  PImage img2 = loadImage("moon.jpg");
  noStroke();
  sphereDetail(100);
  earth = createShape(SPHERE, 500);
  moon = createShape(SPHERE, 100);
  earth.setTexture(img1);
  moon.setTexture(img2);
  frameRate(60);
}

float a = 0;
float b = 0;
final float DEG2RAD = PI/180;

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2, -1400);
  rotateZ(23.5 * DEG2RAD);
  rotateY(a);
  shape(earth); 
  a += 2*PI/frameRate;
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, -1400);
  rotateY(b);
  translate(-900,0,0);
  shape(moon);
  b += (2*PI/28.5)/frameRate;
  popMatrix();
=======
PShape earth;
PShape moon;

void setup() {
  size(800,800,P3D);
  PImage img1 = loadImage("earth.jpg");
  PImage img2 = loadImage("moon.jpg");
  noStroke();
  sphereDetail(100);
  earth = createShape(SPHERE, 500);
  moon = createShape(SPHERE, 100);
  earth.setTexture(img1);
  moon.setTexture(img2);
  frameRate(60);
}

float a = 0;
float b = 0;
final float DEG2RAD = PI/180;

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2, -1400);
  rotateZ(23.5 * DEG2RAD);
  rotateY(a);
  shape(earth); 
  a += 2*PI/frameRate;
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, -1400);
  rotateY(b);
  translate(-900,0,0);
  shape(moon);
  b += (2*PI/28.5)/frameRate;
  popMatrix();
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}