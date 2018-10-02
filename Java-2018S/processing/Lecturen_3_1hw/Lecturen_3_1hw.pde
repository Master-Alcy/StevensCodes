PShape earth;

void setup(){
 size(800,800,P3D); 
 PImage img = loadImage("earth.jpg");
 noStroke();        //before draw
 sphereDetail(100);
 earth = createShape(SPHERE,500);
 earth.setTexture(img);
 frameRate(60);
}
final float DEG2RAD = PI/180;
float a = 0;       //declare ths out side
void draw(){
  translate(width/2,height/2,-500); //put this first
  pushMatrix();
  rotateZ(23.5 * DEG2RAD);
  //camera
  //sphere(400);
  //fill(255,0,0);
  rotateY(a);
  //earth.rotateY(0.01); //good to know
  shape(earth);
  popMatrix();
  a+=0.01;
  
  
  
}