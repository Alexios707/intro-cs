float x;
float y; 
float speedX;
float speedY;
float diam = 20;
float rectSize = 200;

void setup() {
  fullScreen();
  fill(255);
  reset();
}

void reset() {
  x = width/2;
  y = height/2;
  speedX = random(3, 10);
  speedY = random(3, 10);
}

void draw() { 
  background(0);
  
  ellipse(x, y, diam, diam);

  rect(0, 0, 20, height);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);

  x += speedX;
  y += speedY;

  // if ball hits movable bar, invert X direction
  if ( x > width-25 && x < width -20 && y > mouseY-rectSize/3 && y < mouseY+rectSize/3 ) {
    speedX = speedX * -1.5;
  } 

  // if ball hits wall, change direction of X
  if (x < 25) {
    speedX *= -1.5;
    speedY *= 1.5;
    x += speedX;
  }


  // if ball hits up or down, change direction of Y   
  if ( y > height || y < 0 ) {
    speedY *= -1;
  }
}

void mousePressed() {
  reset();
}
