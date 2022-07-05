float fallingStarY = 0;
float x = random(0, width);

float[] starX = new float [100];
float[] starY = new float [100];

void setup() {
  size(700, 700);
  background(#270850);
  stroke(255);
  strokeWeight(2);
  x = random(0, width);
  for ( int i = 0; i < 100; i++) {
    float x = random(0, width);
    float y = random(0, height);
    starX[i] = x;
    starY[i] = y;
    point(x, y);
  }
}

void draw() {
  background(#270850);
  stroke(255);
  strokeWeight(6);
  for (int i = 0; i <100; i++) {
    point(starX[i], starY[i]);
  }
  
  fallingStarY++;
  point(x, fallingStarY);
  
}
