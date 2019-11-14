class player {
//store all player-related data here
//e.g. exhaustion, happiness, academics
  float xPos;
  float yPos;
  int playerWidth;
  int playerHeight;
  int credits;
  int hoursWorked;
  float happiness = 0;
  float health = 0;
  float grades = 0;
  float money = 0;
  float exhaustion = 0;
  player(float xPos, float yPos, int playerWidth, int playerHeight) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.playerHeight = playerHeight;
    this.playerWidth = playerWidth;
  }
  
  void drawPlayer() {
  //draws player character
    rectMode(CENTER);
    fill(0);
    //body
    rect(xPos, yPos-15, playerWidth, playerHeight);
    //head
    rect(xPos, yPos-20, playerWidth/2, playerHeight);
  }
  
  void movePlayer() {
  //moves player character
    if (keyPressed) {
      if (keyCode == LEFT)
        xPos -= 5;
      if (keyCode == RIGHT)
        xPos += 5;
    }
  }
  
  void enterBuilding(building b) {
  //determines what happens when player enters a building (e.g. decreases happiness)
    adjustHappy(b.getAffHap());
  }
  
  float getX() {
  //returns horizontal position of player character
    return xPos;
  }
  
  void adjustHappy (int delta) {
  //delta will be the name of every one of these parameters so don't make a separate variable just called delta
    if (happiness <= 100) {
      happiness += delta;
      textSize(10);
      if (delta != 0) {
        if (delta > 0)
          text("+" + delta + " happiness", xPos, yPos - 50);
      }
    } else {
      textSize(10);
      text("You're already living your best life.", xPos, yPos - 50);
    }
  }
  
  void adjustHealth (int delta) {
    health += delta;
  }
  
  void adjustGrades (int delta) {
    grades += delta;
  }
  
  void adjustMoney (int delta) {
    money += delta;
  }
  
  void adjustExhaustion (int delta) {
    exhaustion += delta;
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
}
