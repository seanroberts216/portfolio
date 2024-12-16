// Sean Roberts

class Boxer {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage boxerImage;
  boolean alive;

  // Constructor
  Boxer(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 50;
    health = 50;
    damage = 50;
    speed = 50;
    boxerImage = loadImage("Boxer_AC.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(boxerImage, x, y);
  }
}
