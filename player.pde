class player {
//store all player-related data here
//e.g. exhaustion, happiness, academics
  float xPos;
  float yPos;
  int playerWidth;
  int playerHeight;
  
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
    rect(xPos, yPos, playerWidth, playerHeight);
    //head
    rect(xPos, yPos, playerWidth/2, playerHeight+10);
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
  
  float getX() {
    return xPos;
  }
}
