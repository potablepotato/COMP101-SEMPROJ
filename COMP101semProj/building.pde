class building {
  int xPos;
  int bldgWidth;
  int bldgHeight;
  int affectsHappiness;
  
  PImage image;
  
  building(int x, int bldgWidth, int bldgHeight, int affectsHappiness) {
    xPos = x;
    this.bldgWidth = bldgWidth;
    this.bldgHeight = bldgHeight;
    this.affectsHappiness = affectsHappiness;
  }
  
  void drawBuilding() {
    rectMode(CORNER);
    fill(150);
    rect(xPos, (height-200)-bldgHeight, bldgWidth, bldgHeight);
    image(image, xPos, (height-200)-bldgHeight);
  }
  
  boolean proximityCheck() {
  //check if player is standing in front of building
    if (dist(xPos+bldgWidth/2, 500, player1.getX(), 500) < bldgWidth/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void setImage(String imageName) {
    image = loadImage(imageName);
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
