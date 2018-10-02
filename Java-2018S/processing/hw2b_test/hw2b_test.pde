//Jingxuan Ai
//cite : https://forum.processing.org/two/discussion/18474/koch-snowflake
//I said at almost each line with its meaning to show I really understand.
//I changed many calculations and structures.

int level = 0;
 
void trans(float x, float y, float edge, int level) {
  // edge is the length of the edge of the level 0 triangle
  pushMatrix();
  translate(x, y);      //move to the center
  translate(-edge/2, edge/(2*sqrt(3)));  //move to the upper left
  koch(edge, level);    //draw a koch curve with levels
  translate(edge, 0);   //move to the upper right
  rotate(4*PI/3);       //rotate 240
  koch(edge, level);
  translate(edge, 0);
  rotate(4*PI/3);
  koch(edge, level);
  popMatrix();
  //basicly called a koch curve 3 times to form a closed snowflake
}

void koch(float edge, int level) {
  if (level == 0){
    beginShape();
    vertex(0, 0);                 
    vertex(edge/3, 0);
    vertex(edge/2, edge/(2*sqrt(3)));
    vertex(2*edge/3, 0);
    vertex(edge, 0);
    endShape(); 
    //This is a 0 level koch line
  }
  //This is the recursive function
  //for an 1 level koch line
  if (level > 0) {
    level--;  //update level
    koch(edge/3, level);  //draw the curve with recursion
    pushMatrix();
    translate(edge/3, 0);//move +1/3 length of edge
    rotate(PI/3);      //rotate 60
    koch(edge/3, level);  //start drawing a smaller triangle on a line
    translate(edge/3, 0); 
    rotate(4*PI/3);    //rotate 240
    koch(edge/3, level); //finish drawing the triangular thing
    translate(edge/3, 0);
    rotate(PI/3);
    koch(edge/3, level);  //draw the rest of the curve
    popMatrix();
  }
}

void setup() {
  size(800, 800);
  stroke(255);
  noFill();
  frameRate(1);
}
 
void draw() {
  background(0);
  trans(width/2, height/2, width*0.8, level);
  //orgin at the midle of the screen
  //size of koch is 0.8
  level++;
  if (level == 8){
    level = 0;
  }
}