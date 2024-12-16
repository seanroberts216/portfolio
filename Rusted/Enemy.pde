// Sean Roberts


class Enemy {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage enemyImage;
  boolean alive;

  // Constructor
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 35;
    health = 65;
    damage = 65;
    speed = 35;
    enemyImage = loadImage("Enemy.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(enemyImage, x, y);
  }
  void attack() {
  }
}
