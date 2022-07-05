/*
 Alexios Rekoutis
 7/5/2022
 Loops practice
 */

void setup() {
  size (500, 500);
  background(0);
  /*
  for (int x = 11; x <= 71; x+= 1) {
   println(x);
   }
   
   for (int x = 1; x<= 100; x+= 2) {
   println(x);
   }
   
   for (int x = 1000; x>=0; x-= 10) {
   println(x);
   }
   
   fill(255);
   for (float x = 0; x <= width-30; x += (width-30)/9) {
   square(x, height/2-30, 30);
   }
   
   for (float x = 80; x <= width-80; x += (width-160)/6) {
   circle(x, 300, 50);
   }
   */
   
  for (int x = width/2 - 100; x <= width/2 + 80; x+= 20) {
    for (int y =  height/2 - 100; y <= height/2 +80; y+= 20)
      square(x, y, 20);
  }
}
