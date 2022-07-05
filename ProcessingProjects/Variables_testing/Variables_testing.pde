/*
Alexios Rekoutis
 6/27/2022
 variables practice
 */

float diam = 50;
boolean growing = true;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  circle(width/2, height/2, diam);

  if (growing) {
    diam++; //this is the growing increment

    if (diam>=width) {
      growing = false;
    }
  } else {
    diam--;
    if (diam<=0) {
      growing = true; //this is the decreasing increment 
    }
  }
}
