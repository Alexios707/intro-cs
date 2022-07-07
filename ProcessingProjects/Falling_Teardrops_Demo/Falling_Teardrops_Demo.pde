float[] tearsX = new float[10];
float[] tearsY = new float[10];
float puddleSize = 0;

void setup() {
  
  size(700, 700);
  for(int i = 0; i < tearsX.length; i++) {
    tearsX[i] = random(0, width);
    tearsY[i] = random(0, height);
  }
  
}

void draw() {
  background(0);
  for(int i = 0; i < tearsX.length; i++) {
    tearsY[i] += 1;
    if(tearsY[i] >= height) {
      tearsY[i] = 0;
      puddleSize++;
    }
    teardrop(tearsX[i], tearsY[i], 20);
    
  }
  ellipse(width/2, height - 20, width, puddleSize);
  text(puddleSize, 20, 20);
}



void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);

}
