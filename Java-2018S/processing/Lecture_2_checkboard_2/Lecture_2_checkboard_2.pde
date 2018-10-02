void setup(){
  size (800,800);
}

final int N=8;
 
void draw(){
  background(255);
  final int dx = width/N;
  final int dy = height/N;
  for (int y=0; y<=height; y+=dy){
  for (int x=0; x<=width; x+=dx){
    if(x%200==0 && y%200!=0){
      fill(0);
      rect(x,y,dx,dy);
    }
    if(x%200!=0 && y%200==0){
      fill(0);
      rect(x,y,dx,dy);
    }
  }
}
}
void mousePressed(){
  final int dx = width/N;
  final int dy = height/N;
  println(mouseX,mouseY);
  ellipse(mouseX,mouseY,dx,dy);
}