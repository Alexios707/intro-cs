/*
 AleYios Rekoutis
 6/27/2022
 bouncing motion pt.2
 */
float circleY = 100;
float speedY = 3;
float circleX = 100;
float speedX = 3;
float diam = 50;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  circle(circleX, circleY, diam);

  if (circleY <= 400 && circleX < 100) {
    circleY +=10;
  } else if (circleY > 470 && circleX < 470) {
    circleX = 475;
    circleY = circleY-10;
    speedY = abs(speedX);
  } else if (circleX >= 100) {
    speedX = 0;
    speedY = -1;
  }else  if (circleY >= 400) {
    speedY = 0;
    speedX = -1;
  }
}
