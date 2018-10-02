//Jingxuan Ai
int level=0;

void sierpinski(float x1, float y1, float x2, float y2, float x3, float y3, int level){
  if(level == 0){
    triangle(x1,y1,x2,y2,x3,y3);
    return;
  }
  float x11 = (x1 + x2)/2;
  float y11 = (y1 + y2)/2;
  float x22 = (x2 + x3)/2;
  float y22 = (y2 + y3)/2;
  float x33 = (x3 + x1)/2;
  float y33 = (y3 + y1)/2;
  
  sierpinski(x1,y1 ,x11 ,y11 ,x33 ,y33, level-1);
  sierpinski(x11,y11 ,x2 ,y2 ,x22 ,y22, level-1);
  sierpinski(x22,y22 ,x3 ,y3 ,x33 ,y33, level-1);
}

void setup(){
  size (800,800);
  frameRate(2);
}

void draw(){
  background(0);
  sierpinski(0,height ,width/2,0 ,width,height, level);
  level++;
  if(level == 8){
    level = 0;
  }
}