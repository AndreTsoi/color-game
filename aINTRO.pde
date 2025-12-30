void intro() {
  theme.play();

  textFont(milky);
  //gif
  image(gif[f], 0, 0, width, height);

  f++;
  if (f == numberOfFrames) {
    f = 0;
  }


  //title text
  fill(white);
  animation++;
  if (animation < 10) {
    animationSize+=2;
  }
  if (animation > 10) {
    animationSize-=2;
  }
  if (animation == 19) {
    animation = 0;
  }

  textSize(animationSize);
  text("Color Game", 400, 300);

  //start button
  strokeWeight(5);
  textSize(55);
  tactileRect(550, 600, 200, 100, black, white, gray);
  fill(white);
  text("Start", 650, 645);


  //set timer time
  timer = 80;
}

void introClicks() {
  if (mouseX > 550 && mouseX < 750 && mouseY > 600 && mouseY < 700) {
    mode = GAME;
  }
}
