/*
Alexios Rekoutis
 7/1/2022
 FOR loops
 */

void setup() {
  size(500, 500);
  background(0);

  stroke(255);
  strokeWeight(2);

  for (int x=0; x < width; x += 50) {
    line (x, 0, x, height);
  }

  for (int y=0; y < width; y += 50) {
    line (0, y, width, y);
  }

  for (int x1 = -width; x1 < width; x1 += 50) {
    line (x1, 0, width, height-x1);
  }

  for (int y1 = -height; y1 < height; y1 += 50) {
    line (500, y1, 0, height+y1);
  }
}
void draw() {
}
