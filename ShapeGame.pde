// Sean Roberts | Shape Game | 9 Sept 2024
import processing.sound.*;
int x, y, score, tx, ty, tw, speed;
PImage user1,target1,bg01;
SoundFile l1;

void setup() { // setup runs once at startup
  size(400, 400);
  background(200);
  user1 = loadImage("user1.png");
  target1 = loadImage("target1.png");
  bg01 = loadImage("bg1.png");
  l1 = new SoundFile(this, "laser.wav");
  x = width/2;
  y = height/2;
  score = 0;
  tx = int(random(width));
  ty = int(random(height));
  tw=100;
  speed=0;
}

void draw() { // draw runs on a 30 fps rate
  frameRate(speed + 30);
  background(bg01);
  println(dist(x, y, tx, ty));
  score();

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y -10;
    } else if (key == 's' || key == 'S') {
      y = y +10;
    } else if (key == 'a' || key == 'A') {
      x = x -10;
    } else if (key == 'd' || key == 'D') {
      x = x +10;
    }
  }
  target();
  fill(#2A762D);
  imageMode (CENTER);
  image(user1,x,y);
  //ellipse(x, y, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y  = y - 10;
    } else if (keyCode == DOWN) {
      y = y + 10;
    } else if (keyCode == LEFT) {
      x = x - 10;
    } else if (keyCode == RIGHT) {
      x = x + 10;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(30);
  text("Score:" + score, 15, 30);
}

void target() {
  //rectMode(CENTER);
  //fill(200, 22, 22);
  //rect(tx, ty, tw, tw);
  imageMode (CENTER);
  image(target1, tx, ty);
  tw--;
  target1.resize(tw, tw);
  if(tw < 5) {
    gameOver();
  }
  if (dist(x, y, tx, ty)<50) {

    score = score + 100;
    tx = int(random(width));
    ty = int(random(height));
    tw = 100;
    speed++;
  }
}

void gameOver () {
  background(0);
  textAlign(CENTER);
  textSize(40);
  text("Game Over!",width/2,height/2);
  text("Score:"+ score,width/2, height/2+50);
  noLoop();
}
