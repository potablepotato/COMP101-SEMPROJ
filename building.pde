class building {
  int xPos;
  int yPos;
  int bldgWidth;
  int bldgHeight;
  String bldgName;
  int affectsHappiness;
  
  PImage image;
  
  building(int x, int y, int bldgWidth, int bldgHeight, int affectsHappiness, String bldgName) {
    //use bldgWidth and bldgHeight for rect dimensions representing building door
    xPos = x;
    yPos = y;
    this.bldgWidth = bldgWidth;
    this.bldgHeight = bldgHeight;
    this.bldgName = bldgName;
    this.affectsHappiness = affectsHappiness;
  }
  
  void drawBuilding() {
    rectMode(CORNER);
    fill(150);
    //rect(xPos, (height-200)-bldgHeight, bldgWidth, bldgHeight);
    image(image, xPos, yPos);
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
  
  String getBldgName() {
    return bldgName;
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
