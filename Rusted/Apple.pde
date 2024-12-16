// Chris Behling

class Apple {
  // Member Variables
  int  x, y;
  PImage appleImage;

  // Constructor
  Apple(int x, int y) {
    this.x = x;
    this.y = y;
    appleImage = loadImage("apple_AC.png");
  }
  // Member Methods
  void display() {
    image(appleImage, x, y);
  }
  
  boolean intersect(Human h) {
    float d = dist(x, y, h.x, h.y);
    if (d<20) { // refine the collision detection
      return true;
    } else {
      return false;
    }
  }
}
