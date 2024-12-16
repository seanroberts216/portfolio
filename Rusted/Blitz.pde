// Chris Behling

class Blitz {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage blitzImage;
  boolean alive;

  // Constructor
  Blitz(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 15;
    health = 25;
    damage = 60;
    speed = 100;
    blitzImage = loadImage("Blitz_AC.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(blitzImage, x, y);
  }
}
