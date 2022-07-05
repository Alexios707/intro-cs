float x = 20;
float y = 20;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  circle(x, y, 20);

  if (y <= 480 && x <= 20) {
    y = y + 5;
  } else if (y >= 480 && x < 480) {
    x = x + 5;
  } else if (x >= 480 && y > 20) {
    y = y -  5;
  } else if (y <= 20 && x > 20) {
    x = x - 5;
  }
}

// Move down:
// y = y + 5;
// Move right:
// x = x + 5;
// Move up:
// y = y - 5;
// Move left:
// x = x - 5;
