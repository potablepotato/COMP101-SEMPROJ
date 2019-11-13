//SEMESTER PROJECT
//hurr durr

//create players & buildings - make sure to set yPos to correct screen section (0<y<500)
player player1 = new player(500, 500, 20, 30);
building randomBuilding = new building(100, 100, 60, 10);
building otherBuilding = new building(300, 80, 200, -5);

void setup() {
  size(1000, 700);
  background(255);
  frameRate(60);
  
  randomBuilding.setImage("semProjSpriteADMIN.png");
  otherBuilding.setImage("semProjSpriteRAC.png");
}

void draw() {
  background(255);
  line(0, 500, 1000, 500);
  
  
  //draw buildings
  randomBuilding.drawBuilding();
  otherBuilding.drawBuilding();
  
  //draw & move player
  player1.drawPlayer();
  player1.movePlayer();
  
  //set actions if proximityCheck true
  if (randomBuilding.proximityCheck()) {
    textSize(20);
    text("b r u h, you're blocking the view", randomBuilding.getX(), randomBuilding.getHeight());
    if (keyPressed && keyCode == UP) {
      println("entered building");
      player1.enterBuilding(randomBuilding);
    }
  }
}
