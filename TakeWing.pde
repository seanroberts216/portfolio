// Bird properties
float birdY;
float birdSpeed = 0;
float gravity = 0.3;
float lift = -8;

// Pipe properties
ArrayList<Pipe> pipes;
float pipeSpeed = 2;
float pipeSpacing = 200;
float pipeWidth = 60;

void setup() {
  size(400, 600);
  birdY = height / 2;
  pipes = new ArrayList<Pipe>();
  frameRate(60);
}

void draw() {
  background(135, 206, 250); // Sky blue background

  // Bird movement
  birdSpeed += gravity;
  birdY += birdSpeed;
  if (birdY > height) birdY = height; // Floor collision
  if (birdY < 0) birdY = 0; // Ceiling collision

  // Draw the bird
  fill(255, 255, 0); // Yellow bird
  ellipse(50, birdY, 30, 30);

  // Generate pipes
  if (frameCount % 60 == 0) {
    pipes.add(new Pipe(width, random(height / 4, height / 1.5)));
  }

  // Move pipes and check for collisions
  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipe p = pipes.get(i);
    p.update();
    p.show();

    // Check collision with bird
    if (p.collidesWith(50, birdY)) {
      println("Game Over!");
      noLoop(); // Stop the game
    }

    // Remove off-screen pipes
    if (p.offScreen()) {
      pipes.remove(i);
    }
  }

  // Add a simple ground
  fill(0, 255, 0); // Green ground
  rect(0, height - 50, width, 50);
}

// Bird jump on key press
void keyPressed() {
  if (key == ' ') {
    birdSpeed = lift;
  }
}

class Pipe {
  float x;
  float y;
  float gap = 150; // Vertical gap between pipes

  Pipe(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    x -= pipeSpeed;
  }

  void show() {
    fill(0, 255, 0); // Green pipes
    rect(x, 0, pipeWidth, y); // Top pipe
    rect(x, y + gap, pipeWidth, height - y - gap); // Bottom pipe
  }

  boolean offScreen() {
    return x < -pipeWidth;
  }

  boolean collidesWith(float birdX, float birdY) {
    if (birdX + 15 > x && birdX - 15 < x + pipeWidth) {
      if (birdY - 15 < y || birdY + 15 > y + gap) {
        return true;
      }
    }
    return false;
  }
}
