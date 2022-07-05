/*
Alexios Rekoutis
 6/24/2022
 Demo of polygons
 */

void setup() {
  size(500, 500);
  background(#F06D6B);

  //crown shape
  fill(0);
  beginShape();
  vertex(190, 300);
  vertex(150, 215);
  vertex(210, 250);
  vertex(250, 140);
  vertex(290, 250);
  vertex(350, 215);
  vertex(310, 300);
  vertex(190, 300);
  endShape(CLOSE);
}


void draw() {
}


void mousePressed() {
  println(mouseX, mouseY);
}
