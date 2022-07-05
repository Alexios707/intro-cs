/*
Alexios Rekoutis
 6/27/2022
 This is my little cute robot named bloop. He is made up of many shapes updated with movement
 */

int diam = 30;
boolean growing = true;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);

  //this is the ground
  fill(#36D66C);
  rect(0, 700, 800, 100);

  //Body made from a quad
  //left arm
  fill(#B7BFC1);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(275, 587, 75, 25);

  //right arm
  fill(#B7BFC1);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(450, 587, 75, 25);

  //actual torso
  fill(#B7BFC1);
  stroke(#5C6F98);
  strokeWeight(3);
  quad(340, 590, 400, 523, 460, 590, 400, 700);

  //hovering pad instead of legs
  fill(#08FFF9);
  ellipse(400, 700, 50, 15);

  //head code
  fill(#B7BFC1);
  stroke(#5C6F98);
  strokeWeight(3);
  ellipse(400, 400, 300, 250);

  //eyes are in these bottom lines
  // left eye
  fill(#000000);
  stroke(255);
  strokeWeight(5);
  circle(345, 425, 90);

  // left pupil
  fill(#00BDFF);
  stroke(#00BDFF);
  strokeWeight(5);
  circle(345, 425, diam);

  //right eye
  fill(#000000);
  stroke(255);
  strokeWeight(5);
  circle(455, 425, 90);

  //right pupil
  fill(#00BDFF);
  stroke(#00BDFF);
  strokeWeight(5);
  circle(455, 425, diam);

  //the if statments below are the growth and shrinkage of the pupils
  if (growing) {
    diam++; //this is the growing increment

    if (diam > 85) {
      growing = false;
    }
  } else {
    diam--;
    if (diam<=0) {  //this is the decreasing increment
      growing = true;
    }
  }

  //this is the attempt for a mouth using two lines
  stroke(0);
  strokeWeight(20);
  line(345, 500, 455, 500);

  stroke(#ffffff);
  strokeWeight(5);
  line(350, 500, 450, 500);

  //Little antenna made of a triangle
  triangle(375, 300, 400, 200, 425, 300);
}
