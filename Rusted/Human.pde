class Human {
  // Member Variables
  int stamina, health, damage, speed, x, y;
  PImage c1;
  boolean alive;

  // Constructor
  Human() {
    stamina = 50;
    health = 50;
    damage = 50;
    speed = 5;
    x = 100;
    y = 100;
    c1 = loadImage("Movement_TJ.png");
    alive = false;
  }
  // Member Methods
  void display() {
    image(c1, x, y);
  }
  void move(char dir) {
    if (dir == 'u') {
      y-= 5;
    } else if (dir == 'd') {
      y+= 5;
    } else if (dir == 'l') {
      x-= 5;
    } else if (dir == 'r') {
      x+= 5;
    }
  }
}
