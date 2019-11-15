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
    fill(150);
    //rect(xPos, (height-200)-bldgHeight, bldgWidth, bldgHeight);
    image(image, xPos, yPos);
  }
  
  boolean proximityCheck() {
  //check if player is standing in front of building
    if (dist(xPos+bldgWidth/2, 500, player1.getX(), 500) < 20) {
      return true;
    } else {
      return false;
    }
  }
  
  void giveEnterOption() {
    //check if player is nearby a building's door and display tooltip
    //allow player to enter building by pressing mouse1
    if (proximityCheck()) {
      rectMode(CENTER);
      fill(255);
      rect(player1.getX(), 450, 250, 30);
      textAlign(CENTER);
      fill(0);
      textSize(20);
      text("enter " + bldgName + "?", player1.getX(), 455);
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
