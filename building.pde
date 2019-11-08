class building {
  int xPos;
  int bldgWidth;
  int bldgHeight;
  int affectsHappiness;
  
  building(int x, int bldgWidth, int bldgHeight, int affectsHappiness) {
    xPos = x;
    this.bldgWidth = bldgWidth;
    this.bldgHeight = bldgHeight;
    this.affectsHappiness = affectsHappiness;
  }
  
  void drawBuilding() {
    rectMode(CORNER);
    fill(150);
    rect(xPos, height-bldgHeight, bldgWidth, bldgHeight);
  }
  
  boolean proximityCheck() {
  //check if player is standing in front of building
    if (dist(xPos+bldgWidth/2, 500, player1.getX(), 500) < bldgWidth/2) {
      return true;
    } else {
      return false;
    }
  }
  
  int getAffHap() {
    return affectsHappiness;
  }
  
  int getX() {
    return xPos;
  }
  
  int getHeight() {
    return bldgHeight;
  }
}
