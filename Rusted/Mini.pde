// Chris Behling
// Angelina Calder

class Mini {
  // Member Variables
  int stamina, health, damage, x, y;
  PImage miniImage;
  boolean alive;

  // Constructor
  Mini(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 15;
    health = 25;
    damage = 100;
    miniImage = loadImage("MiniBoss_TJ.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(miniImage, x, y);
  }
  void attack() {
  }
}
