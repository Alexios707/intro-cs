/*
Collision Functions Tester
 */

void setup() {
  size(700, 700);
  background(0);
}

void draw() {
  background(0);
  fill(255);
  rect(100, 200, 100, 40);
  circle(300, 300, 60);
  if (rectangleCircleCollisionCheck(mouseX, mouseY, 30, 60,
    300, 300, 60)) {
    fill(255, 0, 0);
  } else if (rectangleRectangleCollisionCheck(mouseX, mouseY, 30, 60, 
    100, 200, 100, 40)) {
    fill(200, 200, 0);
  } else {
    fill(255);
  }
  rect(mouseX, mouseY, 30, 60);
}
