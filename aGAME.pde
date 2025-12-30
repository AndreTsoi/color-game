void game() {
  println(randomNum);

  theme.pause();

  //buttons
  background(gray);
  fill(white);
  rect(width/2, 0, width/2, height);
  fill(white);
  textSize(70);
  text("MATCH", 205, 630);
  fill(black);
  text("DOESN'T", 605, 600);
  text("MATCH", 600, 665);


  //timer
  timer--;
  if (timer == 0) {

    mode = GAMEOVER;
  }

  //random color and text
  textSize(55);

  fill(colors[randomColor]);
  text(words[randomWord], width/2, map(timer, 0, 80, height, 0));


  //arrow key inputs
  if (left && match()) {
    score();
    left = false;
  } else if (match() == false && right) {
    score();
    right = false;
  } else if (match() && right) {
   fail(); 
  } else if (match() == false && left) {
   fail(); 
  }
  
  //score
  fill(black);
  textSize(40);
  text(score, 50, 100);
}




void gameClicks() {
  //scoring a point
  if (mouseX > 0 && mouseX < 400 && mouseY > 0 && mouseY < 800 && match()) {
    score();
  } else if (mouseX > 400 && mouseX < 800 && mouseY > 0 && mouseY < 800 && match() == false) {
    score();
  } else {
    fail();
  }
}

boolean match() {
  if (randomColor == randomWord) {
    return true;
  } else {
    return false;
  }
}

void split() {
  randomNum = (int) random(0, 10);

  if (randomNum < 5) randomWord = randomColor;
  if (randomNum >= 5) {
    while (randomWord == randomColor) {
      randomColor = (int) random(0, 5);
    }
  }
}

void score() {
  success.rewind();
  success.play();

  score++;

  //re-randomize color and word
  randomColor = (int) random(0, 5);
  randomWord = (int) random(0, 5);

  split();
  timer = 80;
}

void fail() {
  fail.rewind();
  fail.play();
  mode = GAMEOVER;
}
