/*
Avery Feingold
6/27/2022
Oscillating Motion Demo
Created for Intro to CS Summer 2022
*/


// In order to make "oscillating motion" :
// a value that "bounces" back and forth between
// two extremes, we need two variables.
float circleY = 0;
float speedY = 1;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  
  circle(width/2, circleY, 50);
  
  
  
  circleY = circleY + speedY;
  
  if(circleY > height) {
    speedY = -abs(speedY);
  }
  if(circleY < 0) {
    speedY = abs(speedY);
  }
}
