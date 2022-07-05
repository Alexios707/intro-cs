/*
Alexios Rekoutis
 6/24/2022
 moving parts
 */
int y = 0;
int triangle = 0;
int extent = 300;
int redcircle = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  triangle = triangle+1;
  fill(250, 250, 250);
  triangle(0, 0, 0, 100, triangle, 50);

 redcircle=redcircle+1;
  fill(redcircle,0,0);
  circle(width/2,height/2,200);
  
  extent = extent-2;
  fill(255);
  square(0, 0, extent);
  
  if (extent<0) {
    extent=0;
  }
  
  fill(255);
  strokeWeight(1);
  y=y+1;
  square(300,y,30);

  if (y>510) {
    y=0;
  }
}
