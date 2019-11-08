class building {
  int xPos;
  int bldgWidth;
  int bldgHeight;
  
  building(int x, int bldgWidth, int bldgHeight) {
    xPos = x;
    this.bldgWidth = bldgWidth;
    this.bldgHeight = bldgHeight;
  }
  
  void drawBuilding() {
    rectMode(CORNER);
    fill(150);
    rect(xPos, height-bldgHeight, bldgWidth, bldgHeight);
  }
  
  void proximityCheck() {
  //check if player is standing in front of building
    if (dist(xPos+bldgWidth/2, 500, player1.getX(), 500) < bldgWidth/2) {
      textSize(20);
      text("bruh, you're blocking the view", xPos, bldgHeight);
    }
  }
}
