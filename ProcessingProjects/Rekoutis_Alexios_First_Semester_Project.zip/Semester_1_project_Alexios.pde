/*
Alexios Rekoutis
 6/29/2022
 Semester 1 project
 
 I was able to do everything I wanted to and do most of my reaches
 The one thing that I wish i could have done is make the heartbeat correspond with 
 the randomness of the EKG line
 I struggled with the actual structure of the Heart
 
 Reaches:
 use noise to create random line being drawn
 make a body for the ekg
 
 Goal:
 randomly generating points
 immitating an EKG (Karen from Spongebob)
 
 Baseline:
 make a frame with the name ekg
 (https://processing.org/reference/curlybraces.html) used for learning how to do for statements
 (https://mathworld.wolfram.com/HeartCurve.html) used to get the polar equations of a heart
 */
 
float y; // used to create the drawing EKG line (different data set)
float x = 0;

float h; //this is the variable for changing the height of the text 
float speedH = 0.5; //speed of the text moving up and down

float heartSize = 0; //in the heart shape data set
float heartSpeed = 0.1;

float scaleFactor = 2; //in the data set for scaling
float scaleSpeed = 0.5;


void setup() { //This applies to all of the code below 
  size(750, 500);
  background(0); //sets the color for the background
  stroke(0, 255, 0);
}

void draw() {
  fill(0); //this is the rectangle behind the text to also keep it from showing all versions of the txt
  noStroke();
  rect(50, 0, 400, 200);

  fill(255); //this is the code for the text
  textSize(50);
  text("Heart Rate Monitor", 50, h);

  h += speedH; //this is the text moving up and down

  if (h > 150) {
    speedH = -abs(speedH);
  }
  if (h < 50) {
    speedH = abs(speedH);
  }

  stroke(0, 255, 0); //this is the code for the EKG line that randomly generates
  y = noise(float(frameCount)/100); //used frameCount to create a random pattern
  point( x, (height-100) + (y-.5)*100);
  x++; //this is the speed of the EKG
  if (x>width) {
    background(0);
    x = 0;
  }
  noStroke(); //I placed a rectangle behind the heart so it was possible to see the growth and shrinkage
  fill(0);    //otherwise the heart looked like it was just staying still
  rect(500, 10, 200, 200);

  translate(600, 75); //this is the position of the heart
  fill(250, 0, 0);
  stroke(250, 0, 0); //this part of code is the actual coloring of the heart
  strokeWeight(2);
  
  //the heart immitates an actual heartbeat/breathing
  heartSize = heartSize + heartSpeed; //the lines below are the speed of the heart while it grows and shrinks
  if (heartSize >= 5) {
    heartSpeed = -abs(heartSpeed);
  }
  if (heartSize <=1) {
    heartSpeed = abs(heartSpeed);
  }

  beginShape(); //this is the code for the heart using sin and cos to create arcs and curves
  for (float t=0; t<=2*PI; t+=.01) {
    vertex((-16*heartSize*pow(sin(t), 3)), (-(13*heartSize*cos(t)-5*heartSize*cos(2*t)-2*heartSize*cos(3*t)-cos(4*t))));
  }
  endShape();
}

/*
peer feedback
 1. use if statement to move text up and down √ I got the text to move up and down
 2. if I cannot make the heart grow and shrink try to use pushmatrix and popmatrix to move it √ 
 I was able to make the heart grow and shrink
 3. maybe get the color to change X I didnt like how much the color changed
 */
