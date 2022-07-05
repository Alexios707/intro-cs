/*
Alexios Rekoutis
 6/30/2022
 fuinctions
 */

float y = 0;
float y2 = 0;

void setup() {

  // outputs to the GUI: draws something
  size(500, 500);

  // does not output
  fill(100, 255, 0);
  textSize(40);

  // outputs to the code: "returns" a value
  int x = int(random(0, 10));
  abs(x);
}

void diamond(float xOffset, float yOffset) {
  push();
  rectMode(CENTER);
  translate(xOffset, yOffset);
  rotate(radians(45));
  square(0, 0, 100);
  pop();
}

void tearDrop(float x, float y) {
  push();
  rectMode(CENTER);
  translate(x, y);
  noStroke();
  fill(0, 0, 255);
  arc(15, 30, 10, 10, 0, PI, OPEN);
  triangle(10, 30, 15, 15, 20, 30);
  pop();
}

void draw() {
  background(0);
  tearDrop(240, y);
  tearDrop(300, y2);
  y += 1.6;
  y2 += 2;
  if (y >= 500) {
  y = 0;
  }
  if(y2 > 500) {
  y2 = 0;
  }
}
