/*
Alexios Rekoutis
 7/6/2022
 Final project flappy bird
 References:
 - (https://processing.org/reference/image_.html) reference for how to use image
 - (https://processing.org/reference/PImage.html) reference for how to use PImage
 - (https://processing.org/reference/imageMode_.html) reference for how to use imageMode
 - (https://processing.org/reference/loadImage_.html) reference for how to use loadImage
 - ((https://processing.org/reference/Array.html) and (https://processing.org/examples/arrayobjects.html)) reference for complex arrays
 - (https://www.youtube.com/watch?v=8gMd0ftWp_Y) reference for using the score board and highscore aspects
 - (https://processing.org/examples/requestimage.html) reference for requesting images
 - ((https://processing.org/examples/conditionals2.html) and (https://processing.org/examples/logicaloperators.html)) reference for conditionals
 - ((https://www.youtube.com/watch?v=I1qTZaUcFX0) and (https://github.com/Jaryt/FlappyBirdTutorial)) demo for a really complex flappy bird
 I used all of the processing references to learn complex if and condtional statements and I used the videos to see how the more complex
 versions of flappy bird were coded
 */
PImage backgroundPic;
PImage flappyBirdPic;
PImage incomingWall;
PImage welcome;
int game;
int score;
int highscore;
int x;
int y;
int vertical;
int wallx[] = new int[2];
int wally[] = new int[2];

void setup() {
  backgroundPic = loadImage("Background1 copy.png");
  flappyBirdPic = loadImage("bird copy.png");
  incomingWall = loadImage("wall(1) copy.png");
  welcome = loadImage("StartScreen(2) copy.png");
  game = 1;
  score = 0;
  highscore = 0;
  x = -300;
  vertical = 0;
  size(600, 800);
  fill(0, 0, 0);
  textSize(20);
}
void draw() {
  background(0);
  if (game == 0) { // before the start of the game
    imageMode(CORNER); // sets up the
    image(backgroundPic, x, 0);
    image(backgroundPic, x+backgroundPic.width, 0);
    x -= 6;
    vertical += 1;
    y += vertical;
    for (int i = 0; i < 2; i++) {
      imageMode(CENTER);
      image(incomingWall, wallx[i], wally[i] - (incomingWall.height/2+100));
      image(incomingWall, wallx[i], wally[i] + (incomingWall.height/2+100));
      if (wallx[i] < 0) {
        wally[i] = (int)random(200, height-200);
        wallx[i] = width;
      } 
    }
    image(flappyBirdPic, width/2, y);
    strokeWeight(5);
    text("Score: " +score, 15, 30);
  } else {
    imageMode(CENTER);
    image(welcome, width/2, height/2);
    textSize(25);
    text("Best Score: " +highscore, 50, 250);
  }
}
boolean rectangleCircleCollisionCheck(float rx, float ry, float rw, float rh, float cx, float cy, float cd) {
  float testX = cx;
  float testY = cy;

  if (cx < rx) testX = rx;
  else if (cx > rx + rw) testX = rx + rw;
  if (cy < ry) testY = ry;
  else if (cy > ry + rh) testY = ry + rh;
  float dX = cx - testX;
  float dY = cy - testY;
  float distance = sqrt(dX*dX + dY*dY);
  return (distance < cd/2);
}

void keyPressed() {
  vertical = -15;
  if (game==1) {
    wallx[0] = 600;
    wally[0] = y = height/2;
    wallx[1] = 800;
    wally[1] = 600;
    x = game = score = 0;
  }
}
