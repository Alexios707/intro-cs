/*
Alexios Rekoutis
 7/1/2022
 */

float r;
float g;
float b;

void setup() {
  size(500, 500);

  gradient(255, 75, 39, 255, 100, 20);

  for (int x = 30; x < width; x+=95) {
    hut(x, 300, 20, int(random(0, 3)));
  }

  for (int x = 30; x < width; x+=75) {
    shop(x, 350, 20, int(random(0, 3)));
  }

  for (int x = 30; x < width; x+=85) {
    hut(x, 400, 20, int(random(0, 3)));
  }
}

void draw() {
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

void hut(float x, float y, float size, int chimney) {
  rectMode(CENTER);

  strokeWeight(1);
  stroke(0);
  if (chimney == 1) {
    fill(#834845);
    rect(x+size*0.4, y - size*0.8, size*0.2, size*0.5);
  } else if (chimney == 3) {

    fill(#D3CBA9);
    rect(x, y, size, size*1.2);
    fill(#554D2E);
    triangle(x, y - size*1.3, x-size*0.7, y-size*0.6, x+size*0.7, y-size*0.6);
    fill(#4D5F59);
    circle(x - size*0.25, y - size*0.3, size*0.25);
    fill(#D8A9A6);
    rect(x, y+size*0.4, size*0.25, size*0.4);
  }
  fill(#D3CBA9);
  rect(x, y, size, size*1.2);
  fill(#554D2E);
  triangle(x, y - size*1.3, x-size*0.7, y-size*0.6, x+size*0.7, y-size*0.6);
  fill(#4D5F59);
  circle(x - size*0.25, y - size*0.3, size*0.25);
  fill(#D8A9A6);
  rect(x, y+size*0.4, size*0.25, size*0.4);
}

void shop(float x, float y, float size, int option) {
  rectMode(CENTER);
  strokeWeight(0);
  stroke(0);

  fill(#D3CBA9);
  rect(x, y, size, size*1.2);
  fill(#554D2E);
  triangle(x, y - size*1, x-size*0.7, y-size*0.6, x+size*0.7, y-size*0.6);
  fill(#D8A9A6);
  rect(x+size/4, y+size*0.4, size*0.25, size*0.4);
  fill(#4D5F59);
  rect(x - size*0.17, y + size*0.35, size*0.4, size*0.25);
  fill(#5D4C2B);
  rect(x, y-size*0.16, size*0.8, size*0.2, 5);
  fill(255);
  textSize(10);
  textAlign(CENTER, CENTER);
  if (option == 1) {
    text("SMITHY", x, y - size*0.16);
  } else if (option == 2) {
    text("FLORIST", x, y - size*0.16);
  } else if (option == 3) {
    text("MARKET", x, y - size*0.16);
  }
}
