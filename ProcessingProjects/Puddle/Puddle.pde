float x = random(0, width);
float y = random(0, height);
float[] tearX = new float [10];
float[] tearY = new float [10];
float teardrop = 0;
int a = 20;
float puddleSize = 10; 

void setup() {
  size (700, 700);
  background(255);

  for (int i = 0; i < tearX.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    tearX[i] = x;
    tearY[i] = y;
  }
}

void draw() {
  background(255);
  fill(0, 0, 255);
  stroke(0,0,255);
  strokeWeight(6);
  for (int i = 0; i <10; i++) {
    teardrop(tearX[i], tearY[i], 20);
    
    tearY[i] = tearY[i] +1;
    
    if( tearY[i] > height) {
      tearY[i] = 0;
      a += 20;
      puddleSize++;
    }
  }
  ellipse(width/2, height - 5, width, puddleSize);
  text(puddleSize, 20, 20);
}

void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);
}
