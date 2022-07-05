String rps = "";
int r;

void setup() {
  size(200, 200);
  textAlign(CENTER, CENTER);
  textSize(40);
}
void draw() {
  background(#FFE49B);
  text(rps, width/2, height/2);

  square(10, 150, 30);
  
}

void mousePressed() {
  fill(random(0, 255),
       random(0, 255),
       random(0, 255));
  r = int(random(0, 3));
  if(r == 0) {
    rps = "ROCK";
  } else if(r == 1) {
    rps = "PAPER";
  } else {
    rps = "SCISSORS";
  }
}
