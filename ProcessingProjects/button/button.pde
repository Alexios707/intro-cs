float x = 175;
float y = 125;
float w = 150;
float h = 80;
void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  noFill();
}

void draw() {
  background(255);
  fill(255);
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      println("rock");
      fill(0);
      //do stuff
    }
  }
  rect(x, y, w, h);

  fill(255);
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y+100 && mouseY <y+100+h) {
      println("paper");
      fill(0);
      //do stuff
    }
  }
  rect(x, y+100, w, h);

  fill(255);
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y+200 && mouseY <y+200+h) {
      println("scissors");
      fill(0);
      //do stuff
    }
  }
  rect(x, y+200, w, h);
}
