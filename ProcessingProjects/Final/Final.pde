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
PImage backgroundPic; // setting up the image
PImage flappyBirdPic; // setting up the image
PImage incomingWall; // setting up the image
PImage welcome; // setting up the image
PImage end; // setting up the image
int game;
int score;
int highscore;
int x;
int y;
float speed;
int vertical;
int wallx[] = new int[2];
int wally[] = new int[2];

void setup() {
  backgroundPic = loadImage("Background1.png"); //(https://processing.org/reference/image_.html) reference for how to use image
  flappyBirdPic = loadImage("bird.png"); //(https://processing.org/reference/PImage.html) reference for how to use PImage
  incomingWall = loadImage("wall(1).png"); //(https://processing.org/reference/imageMode_.html) reference for how to use imageMode
  welcome = loadImage("StartScreen(2).png"); //(https://processing.org/reference/loadImage_.html) reference for how to use loadImage
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
    if (x <= -backgroundPic.width) x = 0;
    for (int i = 0; i < 2; i++) {
      imageMode(CENTER);
      image(incomingWall, wallx[i], wally[i] - (incomingWall.height/2+100)); // setting up the image positioning according to the screen vertically
      image(incomingWall, wallx[i], wally[i] + (incomingWall.height/2+100)); // setting up the image positioning according to the screen horizontly
      if (wallx[i] < 0) { // determinging the randomness of how the walls are spawned
        wally[i] = (int)random(200, height-200); 
        wallx[i] = width;
      }
      if (wallx[i] == width/2) { // used for making the highscore aspect
        highscore = max(++score, highscore);
      }
      if (y>height||y<0||(abs(width/2-wallx[i])<25 && abs(y-wally[i])>100)) { // if statement for the collision between
        game=1; // the flappy bird image and the wall image
      }
      wallx[i] -= 5;
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
