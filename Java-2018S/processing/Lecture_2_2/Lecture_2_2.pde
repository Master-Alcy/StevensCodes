<<<<<<< HEAD
void setup(){
  size(800,500);
}

void draw(){
  /*
  ellipse(width/2, height/2, min(height,width),min(height,width));  //height is 2r = d
  */
  
  int d = height < width ? height : width;
  // if this function work, I want height as variable, otherwise width
  ellipse(width/2, height/2, d,d);
=======
void setup(){
  size(800,500);
}

void draw(){
  /*
  ellipse(width/2, height/2, min(height,width),min(height,width));  //height is 2r = d
  */
  
  int d = height < width ? height : width;
  // if this function work, I want height as variable, otherwise width
  ellipse(width/2, height/2, d,d);
>>>>>>> abbee7cfb9dbed3396995ffaa67b3bad7c5ed8eb
}