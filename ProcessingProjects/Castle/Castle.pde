/*
Avery Feingold
 6/24/2022
 Demo of Custom Shapes
 Intended for HM Intro to CS
 Relevant reference page:
 https://processing.org/reference/beginShape_.html
 */

void setup() {
  size(500, 500);
  background(255);

  fill(#983A3A);
  // Crown shape
  beginShape();
  vertex(340, 210);
  vertex(340, 90);
  vertex(340, 90);
  vertex(360, 90);
  vertex(360, 100);
  vertex(410, 100);
  vertex(410, 90);
  vertex(430, 90);
  vertex(440, 320);
  vertex(50, 320);
  vertex(50, 140);
  vertex(50,120);
  vertex(70, 120);
  vertex(80, 120);
  vertex(80, 140);
  vertex(140, 140);
  vertex(140, 120);
  vertex(170, 120);
  vertex(170, 210);
    endShape(CLOSE);
}


void draw() {
}



// You can use this to draw points wherever you click,
// and print the coordinates to the console.
// Then just make vertices at those points.

void mousePressed() {
  println(mouseX, mouseY);
  strokeWeight(6);
  point(mouseX, mouseY);
}
