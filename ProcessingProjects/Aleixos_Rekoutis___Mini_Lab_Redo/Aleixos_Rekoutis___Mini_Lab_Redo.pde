/*
 Alexios Rekoutis
 7/5/22
 MINI - LAB - REDO
 some information used for MINI Lab Demo
 Teardrop and diamond shapes copied from teardrop/diamond demo
 */
float r;
float g;
float b;
float y;

void setup() {
  size(500, 500);

  for (float x = 25; x <= width - 50; x += (width-100)/4) {
    rect(x, height/2-50, 50, 100);
  }
  for (int x = 60; x <= 400; x += 80) {
    float r = random(0, 2);
    if (r <= 1) {// circle
      float r2 = random(0, 2);
      if (r2 <= 1) { //diamond
        diamond(x, y, 50, 2);
      } else { // teardrop
        teardrop(50, 250, 20, 1);
      }
    }
  }
}
  void teardrop(float x, float y, float w, int option) {
    triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
    arc(x, y, w, w, radians(-3), radians(183), OPEN);
    if (option == 1) {
      fill(0, 0, 255);
      stroke(0, 0, 255);
      fill(0);
      text(int(random(1, 11)), x, y);
    } else if (option == 2) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
      fill(0);
      text(int(random(1, 11)), x, y);
    }
  }
  void diamond(float x, float y, float w, int option) {
    push();
    translate(x, y);
    rotate(radians(45));
    square(0, 0, w);
    pop();
    if (option == 1) {
      fill(125, 0, 150);
      stroke(0, 0, 255);
      fill(0);
      text(int(random(1, 11)), x, y);
    } else if (option == 2) {
      fill(255, 0, 0);
      fill(0);
      text(int(random(1, 11)), x, y);
    }
  }
