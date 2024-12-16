class Car {
  //Member Variable
  color c;
  float x, y, speed;
  boolean r;

  // Constructor
  Car() {
    c = color(random(255), random(255), random(255));
    x = random(width);
    y = random(height);
    speed = random(5);
    if (random(2)<1) {
      r = true;
    } else {
      r = false;
    }
  }

  // Member Methods
  void move() {
    if (r == true) {
      x = x + speed;
      if (x > width) {
        x = 0;
      }
    } else {
      x = x - speed;
      if (x < 0) {
        x = width;
      }
    }
  }

  void display() {
    fill(0);
    rect(x+2, y-2, 8, 14);
    rect(x+20, y-2, 8, 14);
    fill(c);
    rect(x, y, 30, 10);
  }
}
