void setup(){
  size (800,800);
}

final int N=8;
 
void draw(){
  final int dx = width/N;
  final int dy = height/N;
  for (int y=0; y<=height; y+=dy){
  for (int x=0; x<=width; x+=dx){
    //fill(x%200 == 0&&y%100==0? 0 : 255);//
    rect(x,y,dx,dy);
  }
}
}
void mousePressed(){
  final int dx = width/N;
  final int dy = height/N;
  println(mouseX,mouseY);
  ellipse(mouseX,mouseY,dx,dy);
}