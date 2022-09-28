//Game variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//color pallete
color black = #000000;
color white = #FFFFFF;



void setup() {
 size(800,800); 
 mode = INTRO;
  
  
}

void draw() {
 if(mode == INTRO) {
  intro(); 
 } else if (mode == GAME) {
  game(); 
 } else if (mode == PAUSE) {
  pausescreen(); 
 } else if (mode == GAMEOVER) {
  gameover(); 
 } else {
  println("Mode Error: Mode is " + mode); 
 }
  
  
}



void mouseTouchingRect() {
  
  
}

void tactileRect(int x, int y, int w, int h, color c, color stroke, color ogStroke) {
  fill(c);
  if (mouseTouchingRect(x, y, w, h) {
    stroke(stroke);
  } else {
   stroke(ogStroke);
  }
  rect(x, y, w, h);
  
  
}
