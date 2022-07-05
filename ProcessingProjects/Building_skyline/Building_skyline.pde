/*
Alexios Rekoutis
6/30/2022
Building skyline
*/

float x = 0;
float y = 0;
float w = 0;
float h = 0;

void setup () {
  size(500, 500);
}

void draw() {
  background(#36B3FF);
  building( 60, 250, 80, 250);
  building( 210, 150, 80, 350);
  building( 360, 300, 80, 200);
}


void building (float x, float y, float w, float h) {
  push();
  fill(0);
  rect(x, y, w, h);
  fill(230);
  rect(x + 28, y + 50, 25, 25);
  rect(x + 28, y + 100, 25, 25);
  rect(x + 28, y + 150, 25, 25);

  pop();
}
