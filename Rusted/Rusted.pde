import processing.sound.*;

SoundFile walking;    // Walking sound file
SoundFile laser;      // Laser sound file
Timer walking1,wTime;
PImage bg4, gameplay;
boolean play;
Blitz b1;
Boss b2;
Boxer b3;
Dirty d1;
Enemy e1;
Light l1;
Mini m1;
Apple a1;
InfoPanel panel;
Human c1;
float x, y; // Declare x and y
int welcomeCounter;
PFont mono;

boolean laserPlaying = false; // To prevent laser sound from playing continuously

void setup() {
  size(700, 700);
  walking = new SoundFile(this, "walking.wav");   // Walking sound file
  laser = new SoundFile(this, "laser.wav");       // Laser sound file
  panel = new InfoPanel(0, 100, 3, 1);
  walking1 = new Timer(500);
  wTime = new Timer(5000);
  mono = createFont("AppleMyungjo.vlw",50);

  b1 = new Blitz(25, 200);
  b2 = new Boss(100, 200);
  b3 = new Boxer(200, 200);
  d1 = new Dirty(300, 200);
  e1 = new Enemy(400, 200);
  l1 = new Light(500, 200);
  m1 = new Mini(600, 200);
  a1 = new Apple(100, 150);

  c1 = new Human();
  bg4 = loadImage("bg4.png");
  gameplay = loadImage("Gameplay.png");

  play = false;
  x = 100; // Initialize x
  y = 100; // Initialize y
}

void draw() {
  if (play == false) {
    startScreen();
  } else {
    // this is gameplay
    background(gameplay);
    b1.display();
    b2.display();
    b3.display();
    d1.display();
    e1.display();
    l1.display();
    m1.display();
    c1.display();
    a1.display();
    panel.display();
    // health decreases by 2 every second and score increases by 20 every second

    if (a1.intersect(c1)) {
      a1.x = 165;
      a1.y = 475;
    }

    if (frameCount % 30 == 0) {
      panel.updateScore(10);
      panel.updateHealth(-1);
    }
    // when health reaches zero it takes away one life and resets health to 100
    if (frameCount % 3030 == 0) {
      panel.updateLives(-1);
      panel.updateHealth(100);
    }
    // level increases by 1 every 500 score
    if (frameCount % 1530 == 0) {
      panel.updateLevel(1);
    }

    // Handle movement and sound playing for walking
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        if (!walking.isPlaying()) {  // Check if the walking sound is already playing
          c1.move('u');
          walking.play();
        }
      } else if (key == 's' || key == 'S') {
        if (!walking.isPlaying()) {
          c1.move('d');
          walking.play();
        }
      } else if (key == 'a' || key == 'A') {
        if (!walking.isPlaying()) {
          c1.move('l');
          walking.play();
        }
      } else if (key == 'd' || key == 'D') {
        if (!walking.isPlaying()) {
          c1.move('r');
          walking.play();
        }
      } //else if (key == 'b' || key == 'B') {  // Play laser sound when 'B' is pressed
        //if (!laserPlaying) {
          //laser.play();
          //laserPlaying = true;  // Prevent multiple laser sounds while the key is held down
        }
      }
    }
  //}
//}

void keyPressed() { // Move this outside of draw()
  if (key == CODED) {
    if (keyCode == UP) {
      if (!walking.isPlaying()) {
        c1.move('u');
        walking.play();
      }
    } else if (keyCode == DOWN) {
      if (!walking.isPlaying()) {
        c1.move('d');
        walking.play();
      }
    } else if (keyCode == LEFT) {
      if (!walking.isPlaying()) {
        c1.move('l');
        walking.play();
      }
    } else if (keyCode == RIGHT) {
      if (!walking.isPlaying()) {
        c1.move('r');
        walking.play();
      }
    }
  }
}

void keyReleased() { // Reset laserPlaying flag when key is released
  if (key == 'b' || key == 'B') {
    laserPlaying = false; // Allow laser sound to be played again
  }
}

void startScreen() {
  image(bg4, 0, 0);
  
  if (wTime.isFinished()) {
    wTime.start();
    welcomeCounter++;
  }
  switch(welcomeCounter) {
    case 0:
    fill(255);
    textSize(50);
    textFont(mono);
    text("Welcome", 250,100);
    break;
    case 1:
    fill(255);
    //textSize(50);
     textFont(mono);
    text("To Rusted Ring",225,100);
    break;
    case 2:
    fill(255);
    textSize(50);
    textFont(mono);
    text("You are about to embark \n on a journey", 0,100);
    break;
    case 3:
    fill(255);
    textSize(50);
    textFont(mono);
    text("Never seen before", 200,100);
    break;
    case 4:
    fill(255);
    textSize(50);
    textFont(mono);
    text("It will not be easy", 200,100);
    break;
    case 5:
    fill(255);
    textSize(50);
    textFont(mono);
    text("And there will be danger", 200,100);
    break;
    case 6:
    fill(255);
    textSize(50);
    textFont(mono);
    text("But you will learn", 200,100);
    break;
    case 7:
    fill(255);
    textSize(50);
    textFont(mono);
    text("And you will win", 200,100);
    break;
    case 8:
    fill(255);
    textSize(50);
    textFont(mono);
    text("So get ready to fight", 200,100);
    break;
    case 9:
    fill(255);
    textSize(50);
    textFont(mono);
    text("And good luck", 200,100);
    break;
    default:
    break;
  }
  
  if (keyPressed) {
    play = true;
  }
}
