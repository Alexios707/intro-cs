/*
Alexios Rekoutis
7/6/2022
*/

float x;
float y;
float w;
float h;

void setup() {
  size(750, 750);
  background(0);
  
}
void draw() {
  background(#36B3FF);
  building( 60, 500, 80, 250);
  building( 210, 500, 80, 350);
  building( 360, 500, 80, 200);
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
