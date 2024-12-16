// Sean Roberts

class Dirty {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage dirtyImage;
  boolean alive;

  // Constructor
  Dirty(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 80;
    health = 35;
    damage = 50;
    speed = 35;
    dirtyImage = loadImage("Dirty_AC.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(dirtyImage, x, y);
  }
}
