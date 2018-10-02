<<<<<<< HEAD
//Jingxuan Ai

int x=0;
int c = 0;
void setup() {
  size(1000, 1000);
  background(255,255,0);
  for (int i=0;i<=width;i+=50){
  line(x,0,x,height);
  line(0,x,width,x);
  x+=50;
  }
}
 
void draw() {

  if (mousePressed) {  
    fill (c);
    ellipse(mouseX,mouseY,30,30);
  }
}

void mousePressed(){
    c+=255;
    if(c==510){c=0;}
=======
//Jingxuan Ai

int x=0;
int c = 0;
void setup() {
  size(1000, 1000);
  background(255,255,0);
  for (int i=0;i<=width;i+=50){
  line(x,0,x,height);
  line(0,x,width,x);
  x+=50;
  }
}
 
void draw() {

  if (mousePressed) {  
    fill (c);
    ellipse(mouseX,mouseY,30,30);
  }
}

void mousePressed(){
    c+=255;
    if(c==510){c=0;}
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}