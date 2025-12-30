void gameover() {
  background(black);
  fill(white);

  //setting the new high score
  if (score > highscore) {
    highscore = score;
  }

  //game over text

  textSize(70);
  text("Game Over", 400, 200);

  //different variations of score displays

  if (score == 0 && highscore == 0) {
    text("Score: " + score, 400, 400);
  } else if (highscore == score) {
    fill(green);
    text("New High score:  " + highscore, 400, 400);
  } else {
    fill(white);
    text("Score: " + score, 400, 400);
    text("High score: " + highscore, 400, 500);
  }

  //button to restart
  tactileRect(550, 600, 200, 100, black, white, gray);
  textSize(45);
  fill(white);
  text("Restart", 652, 650);
}

void gameoverClicks() {
  if (mouseX > 550 && mouseX < 750 && mouseY > 600 && mouseY < 700) {
    mode = INTRO;
    timer = 80;
    score = 0;
    left = false;
    right = false;
    theme.rewind();
    randomColor = (int) random(0, 5);
    randomWord = (int) random(0, 5);
  }
}
