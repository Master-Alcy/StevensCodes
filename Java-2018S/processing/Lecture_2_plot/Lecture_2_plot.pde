void setup(){
  size(800,800);
}

float ang=0;
void draw(){
  background(255);
  translate(width/2,height/2);
  //translate
  //scale//strokeWight(0) with it//
  rotate(ang);
  line(0,0,400,0);
  stroke(random(255),random(255),random(255));
  ang+=.01;
  
  
}