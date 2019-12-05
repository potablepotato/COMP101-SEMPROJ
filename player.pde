class player {
//store all player-related data here
//e.g. exhaustion, happiness, academics
  float xPos;
  float yPos;
  int playerWidth;
  int playerHeight;
  int credits;
  int hoursWorked;
  float happiness = 50;
  float health = 50;
  float grades = 50;
  float money = 0;
  float exhaustion = 0;
  PImage playerSprite;
  
  player(float xPos, float yPos, int playerWidth, int playerHeight) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.playerHeight = playerHeight;
    this.playerWidth = playerWidth;
  }
  
  void drawPlayer() {
  //draws player character
    imageMode(CENTER);
    image(playerSprite, xPos, yPos-25, 40, 60);
    imageMode(CORNER);
  }
  
  void movePlayer() {
  //moves player character
    if (keyPressed) {
      if (keyCode == LEFT)
        xPos -= 5;
      if (keyCode == RIGHT)
        xPos += 5;
    }
    if (xPos < 0) {
      xPos = width;
    } else if (xPos > width) {
      xPos = 0;
    }
  }
  
  //shoot chem books
  void attack() {
    
  }
  
  void enterBuilding(building b) {
    adjustStats(b.getStatEffects());
  }
  
  float getX() {
  //returns horizontal position of player character
    return xPos;
  }
  
  void adjustStats (int[] statEffects) {
    if (happiness <= 100)
      happiness += statEffects[0];
    if (health <= 100)
      health += statEffects[1];
    money += statEffects[2];
    grades += statEffects[3];
    exhaustion += statEffects[4];
  }
  
  float getHappiness() {
    return happiness;
  }
  float getHealth() {
    return health;
  }
  float getGrades() {
    return grades;
  }
  float getMoney() {
    return money;
  }
  float getExhaustion() {
    return exhaustion;
  }
  
  void setImage(String imageName) {
    playerSprite = loadImage(imageName);
  }
}
