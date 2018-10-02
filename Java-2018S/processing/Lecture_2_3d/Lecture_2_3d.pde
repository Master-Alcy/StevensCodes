void setup(){
  size (800,800, P3D);
}

float ang = 0.0;
void draw(){
  background(0);
  translate(width/2, height/2,0);
  //sphere(500);
  scale(1,-1,1);
  rotateX(ang);
  rotateY(ang);
  rotateZ(ang);
  beginShape();
  fill(255,0,0);
  vertex(-width/2,-height/2);
  fill(0,255,0);
  vertex(0,height/2);
  fill(0,0,255);
  vertex(width/2,-height/2);
  endShape();
  ang-=0.01;
  
  
  
}
  
  
  
  
  
  