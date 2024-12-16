// Chris Behling
// Angelina Calder

class Boss {
  // Member Variables
  int stamina, health, damage, x, y, speed;
  PImage bossImage;
  boolean alive;

  // Constructor
  Boss(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 45;
    health = 75;
    damage = 100;
    speed = 80;
    bossImage = loadImage("Boss_TJ.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(bossImage, x, y);
  }
  void attack() {
  }
}
