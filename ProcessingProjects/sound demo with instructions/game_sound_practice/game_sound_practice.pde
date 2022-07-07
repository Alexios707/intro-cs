import processing.sound.*;
SoundFile soundFile;
float[] tearX = new float[10];
float[] tearY = new float[10];
String screenText = "Click anywhere to begin plopping";
float puddleSize = 0;
int b = 0;


void setup() {
  size(600, 600);
  //similar to append and creating a new array
  //formatting is (this, "NAME OF YOUR AUDIO.TYPE OF AUDIO")

  soundFile = new SoundFile(this, "plop2.mp3");

  //assigning a value to each place in the array
  for (int i = 0; i < tearX.length; i++) {
    tearX[i] = random(0, width);
    tearY[i] = random(0, height);
  }
}

void draw() {
  background(0, 0, b);
  text(screenText, width/2, height/2);
  textAlign(CENTER);
  textSize(40);

  if (mousePressed) {
    screenText = "";
    b = 255;
  }

  if (screenText == "") {
    for (int i = 0; i < tearX.length; i++) {
      tearY[i] += 1; //increasing position of y-axis
      if (tearY[i] >= height) { //once it is a greater value than the height
        tearY[i] = 0; //reset
        puddleSize++;
        soundFile.play(); //play sound when drop hits the "floor"
      }
      fill(138, 245, 255);
      teardrop(tearX[i], tearY[i], 20);
    }
  }
  ellipse(width/2, height - 20, width, puddleSize);
}

void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);
}
