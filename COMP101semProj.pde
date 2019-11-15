//SEMESTER PROJECT
//hurr durr

//create players & buildings - make sure to set yPos to correct screen section (0<y<500)
player player1 = new player(500, 500, 20, 30);
building randomBuilding = new building(20, 125, 200, 60, 10, "Admin Building");
building otherBuilding = new building(400, 345, 300, 200, -5, "RAC");

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
  
  printMouseXY();
  
  //draw buildings
  randomBuilding.drawBuilding();
  otherBuilding.drawBuilding();
  
  //draw & move player
  player1.drawPlayer();
  player1.movePlayer();
  
  //give player the option to enter a building if door nearby
  randomBuilding.giveEnterOption();
  otherBuilding.giveEnterOption();
  
  //add bars to stat section
  drawStats();
}

void mousePressed() {
  if (randomBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(randomBuilding);
      println("entered building");
    }
  } else if (otherBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(otherBuilding);
      println("entered building");
    }
  } else {
    println("you clicked nothing");
  }
}

void drawStats() {
  //draw all stats within coordinate bounds (0<x<1000, 500<y<700)
  String[] statNames = {"happiness", "health", "grades", "money", "exhaustion"};
  textSize(30);
  float textYPos = 550;
  float textXPos = 100;
  for(int i = 0; i < 5; i++) {
    text(statNames[i], textXPos, textYPos);
    textYPos += 30;
  }
  fill(0, 200, 0);
  rectMode(CORNER);
  rect(275, 530, player1.getHappiness(), 20);
  rect(275, 560, player1.getHealth(), 20);
  rect(275, 590, player1.getGrades(), 20);
  rect(275, 620, player1.getMoney(), 20);
  rect(275, 650, player1.getExhaustion(), 20);  
}

void printMouseXY() {
  //print mouse coordinates in console
  println("mouseX: " + mouseX + " ... mouseY: " + mouseY);
}
