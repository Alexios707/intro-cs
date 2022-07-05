/*
 Alexios Rekoutis
 6/27/2022
 bouncing motion
 */
float circleOne = 0;
float speedCircleBounce = 5;

void setup() {
  size(500, 500);
  circleOne = 0;
  speedCircleBounce = 3;
}

void draw() {
  background(0);
  circle(width/2, circleOne, 50);
  circleOne = circleOne + speedCircleBounce; 
  if (circleOne > height) {
    speedCircleBounce = -Math.abs(speedCircleBounce);
  }
  if (circleOne < 1) {
   speedCircleBounce = Math.abs(speedCircleBounce); 
  }

}
