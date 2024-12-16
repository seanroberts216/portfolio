// Sean Roberts

class Light {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage lightImage;
  boolean alive;

  // Constructor
  Light(int x, int y) {
    this.x = x;
    this.y = y;
    stamina = 50;
    health = 25;
    damage = 50;
    speed = 75;
    lightImage = loadImage("Light_AC.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(lightImage, x, y);
  }
}
