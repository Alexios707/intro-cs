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
  background(#E0C68B);
  
  fill(#983A3A);
  // Crown shape
  beginShape();
  vertex(190, 300);
  vertex(150, 215);
  vertex(210, 250);
  vertex(250, 140);
  vertex(290, 250);
  vertex(350, 215);
  vertex(310, 300);
  
  endShape(CLOSE);
}


void draw() {}



// You can use this to draw points wherever you click,
// and print the coordinates to the console.
// Then just make vertices at those points.

void mousePressed() { 
  println(mouseX, mouseY);
  strokeWeight(6);
  point(mouseX, mouseY);

}
