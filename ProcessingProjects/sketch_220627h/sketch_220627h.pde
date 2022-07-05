/*
Alexios Rekoutis
 6/27/2022
 */

float pupilOffset = 0;
float pupilSpeed = 1;

float faceOffset = 0;
float faceSpeed = 1;

float scaleFactor = 1;
float scaleSpeed = -0.5;

void setup() {
  size(500, 500);
}


void draw() {
  background(0);

  push();

    translate(0, faceOffset);

    fill(220, 200, 0);
  circle(width/2, height/2, 200);
  fill(255, 0, 0);
  arc(width/2, height/2+20, 140, 100, radians(0), radians(180));

  fill(255);
  circle(width/2-40, height/2-20, 40);
  circle(width/2+40, height/2-20, 40);

  push();
  translate(pupilOffset, 0);

  fill(0);
  circle(width/2-40, height/2-20, 20);
  circle(width/2+40, height/2-20, 20);

  pop();

  pop();

  pupilOffset = pupilOffset + pupilSpeed;
  if (pupilOffset > 10) {
    pupilSpeed = -abs(pupilSpeed);
  }
  if (pupilOffset <-10) {
    pupilSpeed = abs(pupilSpeed);
  }

  faceOffset = faceOffset + faceSpeed;
  if (faceOffset > 100) {
    faceSpeed = -abs(faceSpeed);
  }
  if (faceOffset <-100) {
    faceSpeed = abs(faceSpeed);
  }
}
