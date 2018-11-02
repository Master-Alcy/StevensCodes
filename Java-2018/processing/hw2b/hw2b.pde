<<<<<<< HEAD
//Jingxuan Ai
int level=1;

void koch(float x1, float y1, float x2, float y2, float x3, float y3, int level){
  if(level == 0){
    triangle(x1,y1,x2,y2,x3,y3);
    return;
  }
  float x11 = (x1 + x2)/3;
  float y11 = (y1 + y2)/3;
  float x12 = 2*(x1 + x2)/3;
  float y12 = 2*(y1 + y2)/3;
  
  float x21 = (x2 + x3)/3;
  float y21 = 2*(y2 + y3)/3;
  float x22 = 2*(x2 + x3)/3;
  float y22 = (y2 + y3)/3;
  
  float x31 = 2*(x3 + x1)/3;
  float y31 = 2*(y3 + y1)/3;
  float x32 = (x3 + x1)/3;
  float y32 = (y3 + y1)/3;
  
  float edg = sqrt(pow((y12-y11),2)+pow((x12-x11),2));
  float x1v = x12-edg;
  float y1v = y11+edg/sqrt(3);
  float x2v = x21+edg;
  float y2v = y22+edg/sqrt(3);
  float x3v = (x31+x32)/2;
  float y3v = y31-edg/sqrt(3);
  
  koch(x11,y11 ,x1v ,y1v ,x12 ,y12, level-1);
  koch(x21,y21 ,x2v ,y2v ,x22 ,y22, level-1);
  koch(x31,y31 ,x3v ,y3v ,x32 ,y32, level-1);
}

void setup(){
  size (800,800);
  stroke(255);
  smooth();
  noFill();
  frameRate(1);
}

void draw(){
  background(0);
  koch(0,3*height/4 ,width/2,0 ,width,3*height/4, level);
  level++;
  if(level == 2){
    level = 1;
  }
=======
//Jingxuan Ai
int level=1;

void koch(float x1, float y1, float x2, float y2, float x3, float y3, int level){
  if(level == 0){
    triangle(x1,y1,x2,y2,x3,y3);
    return;
  }
  float x11 = (x1 + x2)/3;
  float y11 = (y1 + y2)/3;
  float x12 = 2*(x1 + x2)/3;
  float y12 = 2*(y1 + y2)/3;
  
  float x21 = (x2 + x3)/3;
  float y21 = 2*(y2 + y3)/3;
  float x22 = 2*(x2 + x3)/3;
  float y22 = (y2 + y3)/3;
  
  float x31 = 2*(x3 + x1)/3;
  float y31 = 2*(y3 + y1)/3;
  float x32 = (x3 + x1)/3;
  float y32 = (y3 + y1)/3;
  
  float edg = sqrt(pow((y12-y11),2)+pow((x12-x11),2));
  float x1v = x12-edg;
  float y1v = y11+edg/sqrt(3);
  float x2v = x21+edg;
  float y2v = y22+edg/sqrt(3);
  float x3v = (x31+x32)/2;
  float y3v = y31-edg/sqrt(3);
  
  koch(x11,y11 ,x1v ,y1v ,x12 ,y12, level-1);
  koch(x21,y21 ,x2v ,y2v ,x22 ,y22, level-1);
  koch(x31,y31 ,x3v ,y3v ,x32 ,y32, level-1);
}

void setup(){
  size (800,800);
  stroke(255);
  smooth();
  noFill();
  frameRate(1);
}

void draw(){
  background(0);
  koch(0,3*height/4 ,width/2,0 ,width,3*height/4, level);
  level++;
  if(level == 2){
    level = 1;
  }
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}