//SEMESTER PROJECT
//hurr durr

player player1 = new player(500, 500, 20, 50);
building randomBuilding = new building(100, 80, 60);

void setup() {
  size(1000, 500);
  background(255);
  frameRate(60);
}

void draw() {
  background(255);
  randomBuilding.drawBuilding();
  player1.drawPlayer();
  player1.movePlayer();
  randomBuilding.proximityCheck();
}
