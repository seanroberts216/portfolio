// Sean Roberts | Cars | 23 sept 2024
Car[] cars = new Car [100];
Car c1, c2;

void setup() {
  size(1000, 1000);
  c1 = new Car();
  c2 = new Car();
  for (int i = 0; i<cars.length; i+=1) {
    cars [i]= new Car();
  }
}

void draw() {
  background(255);
  c1.display();
  c1.move();
  c2.display();
  c2.move();
  for (int i = 0; i<cars.length; i+=1) {
    cars[i].display();
    cars[1].move();
  }
}
