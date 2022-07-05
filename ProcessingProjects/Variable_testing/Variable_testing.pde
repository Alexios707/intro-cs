/*
Alexios Rekoutis
 6/24/2022
 Variables
 */

int diameter = 30;
int x = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  diameter = diameter;
  noStroke();
  fill(255);
  circle(width/2+x, height/2, diameter);
  x=x+3;
  circle(width/2, height/2-x, diameter);
 
 if (x==300){
  x=0;
 }
}
