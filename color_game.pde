import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer theme, success, fail;

//font
PFont milky;


//Game variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//color pallete
color black = #000000;
color white = #FFFFFF;
color gray = #808080;
color red = #FF0000;
color blue = #0000FF;
color brown = #964B00;
color yellow = #F6BE00;
;
color green = #00FF00;

//gif
PImage[] gif;
int f;
int numberOfFrames;
float keyCounter = 0;
//game variables
int score = 0;
int highscore = 0;
int animation = 0;
int animationSize = 85;
int randomWord = (int) random(0, 5);
int randomColor = (int) random(0, 5);
String[] words = {"RED", "GREEN", "BLUE", "YELLOW", "BROWN"};
color[] colors = {red, green, blue, yellow, brown};
int randomNum, timer;
boolean left, right;

void setup() {
  size(800, 800);
  numberOfFrames = 61;
  gif = new PImage[numberOfFrames];

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  success = minim.loadFile("SUCCESS.wav");
  fail = minim.loadFile("FAILURE.wav");

  int i = 0;

  while (i < numberOfFrames) {

    gif[i] = loadImage("frame_" + i + "_delay-0.02s.gif");

    i++;

    //font
    milky = createFont("MilkyCoffee.ttf", 200);
  }

  mode = INTRO;
  textAlign(CENTER, CENTER);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error: Mode is " + mode);
  }
}



boolean mouseTouchingRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

void tactileRect(int x, int y, int w, int h, color c, color stroke, color ogStroke) {
  fill(c);
  if (mouseTouchingRect(x, y, w, h)) {
    stroke(stroke);
  } else {
    stroke(ogStroke);
  }
  rect(x, y, w, h);
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
