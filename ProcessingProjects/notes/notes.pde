float x;
float y;

void setup() {
  size(500, 500);
}

void draw() {
  x = random(1, 250);
  y = random(1, 250);
  circle(x, y, 30);

    if (x < 250 && y < 250) {
      fill(#FF0505);
  } 
}
