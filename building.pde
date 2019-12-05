class building {
  int xPos;
  int yPos;
  String bldgName;
  int affectsHappiness;
  int affectsHealth;
  int affectsMoney;
  int affectsGrades;
  int affectsExhaustion;
  
  PImage image;
  
  building(int x, String bldgName) {
    //use bldgWidth and bldgHeight for rect dimensions representing building door
    xPos = x;
    this.bldgName = bldgName;
  }
  
  void drawBuilding() {
    fill(150);
    //rect(xPos, (height-200)-bldgHeight, bldgWidth, bldgHeight);
    image(image, xPos, 500-image.height);
  }
  
  boolean proximityCheck() {
  //check if player is standing in front of building
    if (dist(xPos+image.width/2, 500, player1.getX(), 500) < 20) {
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
  
  void setStatEffects(int eff1, int eff2, int eff3, int eff4, int eff5) {
    affectsHappiness = eff1;
    affectsHealth = eff2;
    affectsMoney = eff3;
    affectsGrades = eff4;
    affectsExhaustion = eff5;
  }
  
  int[] getStatEffects() {
    int[] statEffects = {affectsHappiness, affectsHealth, affectsMoney, affectsGrades, affectsExhaustion};
    return statEffects;
  }
  
  void setImage(String imageName) {
    image = loadImage(imageName);
  }
  
  String getBldgName() {
    return bldgName;
  }
  
  int getX() {
    return xPos;
  }
}
