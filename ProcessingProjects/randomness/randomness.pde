/*
 Alexios Rekoutis
 6/28/2022
 Randomness demo
 */

float x = 0;
float y = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  // random(lo, hi) generates a radnom float value between lo and hi
  //print(random(0, 10));

  // generate random colors with
  // fill(random(255), random(255), random(255));
  // circle(width/2, height/2, 300)
  
  // generate random sizes
  //circle(width/2, height/2, random(500, 500));
  
  circle(x, y, 30);
}
