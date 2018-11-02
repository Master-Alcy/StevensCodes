void setup()
{
 size(800, 600, OPENGL);
 smooth();
 
}

void draw()
{
 background(255);
 lights();
 //noStroke();
 
 translate(width/2, height/2);


fill(255, 0, 0);
 pushMatrix();


   rotateX(radians(frameCount*3));
   rotateY(radians(frameCount*3));
   sphereDetail(30);
   sphere(100);

 popMatrix();
 
 fill(0, 255, 0);
 pushMatrix();
   rotateY(radians(frameCount*2));
   translate(-200, 0);
   sphereDetail(30);
   sphere(50);
 popMatrix();
}