//SEMESTER PROJECT
//hurr durr

player player1 = new player(500, 500, 20, 50);
building randomBuilding = new building(100, 80, 60, 10);
building otherBuilding = new building(300, 40, 70, -5);

void setup() {
  size(1000, 500);
  background(255);
  frameRate(60);
}

void draw() {
  background(255);
  randomBuilding.drawBuilding();
  otherBuilding.drawBuilding();
  player1.drawPlayer();
  player1.movePlayer();
  if (randomBuilding.proximityCheck()) {
    textSize(20);
    text("b r u h, you're blocking the view", randomBuilding.getX(), randomBuilding.getHeight());
    if (keyPressed && keyCode == UP) {
      println("entered building");
      player1.enterBuilding(randomBuilding);
    }
  }
}
