float r;
float g;
float b;

void setup() {
  size(500, 500);


  gradient(93, 207, 250, 6, 98, 2);
  
}


void gradient(float r1, float g1, float b1, 
              float r2, float g2, float b2) {
  for (int i = 0; i < height; i++ ) {
    r = map(i, 0, height-1, r1, r2);
    g = map(i, 0, height-1, g1, g2);
    b = map(i, 0, height-1, b1, b2);

    stroke(r, g, b);
    line(0, i, width, i);
  }
}
