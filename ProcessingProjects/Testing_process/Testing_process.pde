/*
Alexios Rekoutis
6/23/2022
Input, Output, and Communication Demo
*/

/* Inputs to Processing:
* mouse
* keyboard
* webcam
* internet (accessing APIs)
* including files 
  * code 
  * images
*/


/* Outputs from Processing:
* sketch (GUI)
* console
*/

void setup() {
  print("Hello\n"); // the \n is a newline character
  println("Hello, World!"); // generally, use println() to make a line
  
  //outputting to the console is mostly useful for the coder
  
  // outputting to the GUI is for the user
  size(500,500);
  background(0);
  fill(255);
  textSize(15);
  text("Hello User I like your clothing",100,100);
}

// In order for mousePressed to work, you need to have a draw statement
void draw() {
}


void mousePressed() {
  println(mouseX, mouseY);
}

void keyPressed() {
  println("key pressed:" + keyCode);
}
