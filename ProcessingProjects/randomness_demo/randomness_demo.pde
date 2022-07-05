/*
Avery Feingold
 6/28/2022
 Randomness demo
 */

float x;
float y;
float xSpeed;
float ySpeed;

int int_variable;

void setup() {
  size(500, 500);

  x = width/2;
  y = height/2;
  xSpeed = random(-3, 3);
  ySpeed = random(-3, 3);
  int_variable = int(random(0, 3));
}

void draw() {
  background(255);
  // random(lo, hi) generates a random float value between lo and hi
  //println(random(0, 10));


  // We can generate random colors
  //fill(random(255), random(255), random(255));
  //circle(width/2, height/2, 300);

  // We can generate a random size
  // circle(width/2, height/2, random(100, 200));


  //circle(x, y, 30);
  //x += xSpeed;
  //y += ySpeed;
}

void mousePressed() {
  fill(0);
  if (int_variable == 0) {
    print("Rock");
  } else if (int_variable == 1) {
    print("Paper");
  } else if (int_variable == 2) {
    print("Scissors");
  }
}
