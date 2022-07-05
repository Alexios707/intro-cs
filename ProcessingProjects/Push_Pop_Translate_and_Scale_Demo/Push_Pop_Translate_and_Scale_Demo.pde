float pupilOffset = 0;
float pupilSpeed = 1;

float faceOffset = 0;
float faceSpeed = 0.1;

float scaleFactor = 1;
float scaleSpeed;

void setup() { 
  size(500, 500);
  scaleSpeed = -0.01;
}


void draw() {
  background(0);
  
  
  push();
  
  
  scale(scaleFactor);
  
  scaleFactor = scaleFactor + scaleSpeed;
  if(scaleFactor < .3) {
    scaleSpeed = abs(scaleSpeed);
  }
  if(scaleFactor > 1.5) {
    scaleSpeed = -abs(scaleSpeed);
  }
  
  
  //translate(0, faceOffset);
  

  
  fill(220, 200, 0);
  circle(width/2, height/2, 200);
  fill(255, 0, 0);
  arc(width/2, height/2 + 20, 140, 100, radians(0), radians(180), PIE);
  
  fill(255);
  circle(width/2 - 40, height/2 - 20, 40);
  circle(width/2 + 40, height/2 - 20, 40);
  
  push();
  //translate(pupilOffset, 0);
  
  fill(0);
  circle(width/2 - 45, height/2 - 20, 15);
  circle(width/2 + 35, height/2 - 20, 15);
  
  pop();
  
  pop();
  
  pupilOffset = pupilOffset + pupilSpeed;
  
  if(pupilOffset > 15) {
    pupilSpeed = -abs(pupilSpeed);
  }
  if (pupilOffset < -5) {
    pupilSpeed = abs(pupilSpeed);
  }
  
  faceOffset = faceOffset + faceSpeed;
  
  if(faceOffset > 100) {
    faceSpeed = -abs(faceSpeed);
  }
  if (faceOffset < -100) {
    faceSpeed = abs(faceSpeed);
  }

  
  fill(255);
  square(400, 100, 50);
}
