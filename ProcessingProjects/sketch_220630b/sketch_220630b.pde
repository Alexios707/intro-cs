/*
Alexios Rekoutis
6/30/2022
Building skyline
*/

float x;
float y;
float w;
float h;

void setup() {
 size(750, 750);
}

void draw() {
  background(0);
  building(50, 600, 125, 350);
}

void building(float x, float y, float w, float h) {
  
  push();
  rectMode(CENTER);
  fill(225);
  triangle(0, 350, 52.5, 200, 100, 350);
  rect(x, y, w, h);
  rect(x, y, w, h);
  rect(x, y, w, h);
  pop();
  
}

void mousePressed() {
  println(mouseX, mouseY);
}
