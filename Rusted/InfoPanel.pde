// InfoPanel Class to display game information
class InfoPanel {
  int score;
  int health;
  int lives;
  int level;
  
  InfoPanel(int initialScore, int initialHealth, int initialLives, int initialLevel) {
    score = initialScore;
    health = initialHealth;
    lives = initialLives;
    level = initialLevel;
  }
  
  // Call this function to update score
  void updateScore(int points) {
    score += points;
  }

  // Call this function to update health
  void updateHealth(int change) {
    health += change;
    health = constrain(health, 0, 100); // Health capped at 100
  }
  
  void updateLives (int change) {
    lives += change;
    lives = constrain(lives,0,3);
  }
  
  void updateLevel(int change) {
    level += change;
  }
  
  // Display the panel with information
  void display() {
    // Draw background for info panel
    fill(50, 50, 50, 150); // Semi-transparent background
    rect(10, 10, 200, 100);
    
    // Set text properties
    fill(255);
    textSize(12);
    
    // Display the score
    text("Score: " + score, 20, 30);
    
    // Display the health
    text("Health: " + health, 20, 50);
    
    text("Lives: " + lives, 20, 70);
    
    text("Level: " + level, 20, 90);
    

  }
}
