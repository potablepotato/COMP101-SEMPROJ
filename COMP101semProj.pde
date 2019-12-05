//SEMESTER PROJECT
//hurr durr

//create players & buildings
player player1 = new player(width/2, 500, 20, 30);
building adminBuilding = new building(width, "Administration");
building racBuilding = new building(width + 200, "RAC");
building commonsBuilding = new building(width + 400, "Commons");
building foodBuilding = new building(width + 600, "Beef-fil-a");
building dormBuilding = new building(width + 800, "Dorms");
building pahbBuilding = new building(width + 1000, "PAHB");

int numCredits = 12;


boolean menuCompleted = false;
boolean skyDrawn = false;

PImage skyBG;

//timekeeping data
final float totalTime = 360;
final float totalDayTime = 240;
final float totalNightTime = 120;
float currentTime = 0;
float menuTimeElapsed = 0;
final int totalWeeks = 15;
int currentWeek;
int numHoursWork = 0;
int[] weekGrade = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int gradesMax = currentWeek * numCredits;
float grades = 0;

void setup() {
  fullScreen();
  background(255);
  frameRate(60);
  
  //skyBG = loadImage("semProjSpriteSKYBG.png");
  //image(skyBG, 0, 0, width, height);
  
  player1.setImage("semProjSpritePLAYER1.png");
  
  adminBuilding.setImage("semProjSpriteADMIN.png");
  racBuilding.setImage("semProjSpriteRAC.png");
  commonsBuilding.setImage("semProjSpriteCOMMONS.png");
  foodBuilding.setImage("semProjSpriteFOODPLACE.png");
  dormBuilding.setImage("semProjSpriteDORM.png");
  pahbBuilding.setImage("semProjSpritePAHB.png");
  
  //set buildings' effects on player stats
  //respectively: happiness, health, wealth, grades, exhaustion
  adminBuilding.setStatEffects(-2, 0, 0, +1, +1); //office hours
  racBuilding.setStatEffects(+2, +5, 0, 0, +1); //exercise
  commonsBuilding.setStatEffects(+5, +1, 0, 0, +1); //hang out
  foodBuilding.setStatEffects(+5, +1, -1, 0, +1); //eating
  dormBuilding.setStatEffects(-2, -1, 0, +1, +1); // self study
  pahbBuilding.setStatEffects(-2, 0, 0, +5, +1); // class
}

void draw() {
  if (menuCompleted == true && skyDrawn == false) {
    skyBG = loadImage("semProjSpriteSKYBG.png");
    image(skyBG, 0, 0, width, height);
    skyDrawn = true;
  }
  
  noStroke();
  rectMode(CORNER);
  fill(56, 229, 245);
  rect(0, 430, width, 70);
  fill(150, 210, 50);
  rect(0, 480, width, 20);
  stroke(0);
  fill(255);
  rect(0, 505, width, height);
  strokeWeight(10);
  line(0, 505, width, 505);
  strokeWeight(1);
  
  //draw buildings
  adminBuilding.drawBuilding();
  racBuilding.drawBuilding();
  commonsBuilding.drawBuilding();
  foodBuilding.drawBuilding();
  dormBuilding.drawBuilding();
  pahbBuilding.drawBuilding();
  
  //draw & move player
  player1.drawPlayer();
  player1.movePlayer();
  
  //give player the option to enter a building if door nearby
  adminBuilding.giveEnterOption();
  racBuilding.giveEnterOption();
  commonsBuilding.giveEnterOption();
  foodBuilding.giveEnterOption();
  dormBuilding.giveEnterOption();
  pahbBuilding.giveEnterOption();
  
  //add bars to stat section
  drawStats();
  
  printMouseXY();
  
  if(menuCompleted == false) {
    drawMenu();
    menuTimeElapsed = millis()/1000;
  } else {
    currentTime = millis()/1000 - menuTimeElapsed;
    printCurrentTime();
    fill(0);
    rectMode(CENTER);
    rect(width/2, height - 800, 200, 80);
    currentWeek = int(currentTime/360) + 1;
    printCurrentWeek();
  }
  if(weekGrade[currentWeek] > numCredits)
    weekGrade[currentWeek] = numCredits;
    
  while(grades < 60 && currentWeek > totalWeeks) {
    background(0);
    textSize(100);
    textAlign(CENTER);
    text("You flunked out of college.", width/4, height/2);
  }
  
  while(player1.getHealth() <= 0 || player1.getHappiness() <= 0) {
    background(0);
    textSize(100);
    textAlign(CENTER);
    if(player1.getHealth() <= 0)
      text("You're literally just dead. You starved or died of the flu or something.", width/2, height/3);
    if(player1.getHappiness() <= 0)
      text("You're considering suicide as a viable career option.", width/2, height * 2/3);
  }
}

void mousePressed() {
  if (adminBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(adminBuilding);
      println("entered Admin");
    }
  } else if (racBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(racBuilding);
      println("entered RAC");
    }
  } else if (commonsBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(commonsBuilding);
      println("entered Commons");
    }
  } else if (foodBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(foodBuilding);
      println("entered foodplace");
    }
  } else if (dormBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(dormBuilding);
      println("entered Dorm");
    }
  } else if (pahbBuilding.proximityCheck()) {
    if (mouseX > player1.getX()-125 && mouseX < player1.getX()+125 && mouseY > 435 && mouseY < 465) {
      player1.enterBuilding(pahbBuilding);
      println("entered PAHB");
    }
  } else {
    println("you clicked nothing");
  }
}

void drawStats() {
  //draw all stats within coordinate bounds (0<x<1000, 500<y<700)
  String[] statNames = {"happiness", "health", "grades", "money", "exhaustion"};
  textSize(30);
  textAlign(CENTER);
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
  fill(200, 0, 0);
  rect(275, 650, player1.getExhaustion(), 20);  
}

void printMouseXY() {
  //print mouse coordinates on screen
  textSize(10);
  textAlign(CENTER);
  text(mouseX + ", " + mouseY, width - 100, height - 100);
}

void printCurrentTime() {
  //print current time in seconds on screen
  textSize(10);
  textAlign(CENTER);
  text("Seconds elapsed: " + currentTime, width - 100, height - 200);
}

void printCurrentWeek() {
  //print current week on screen
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("Week " + currentWeek, width/2, height - 800);
}

void drawMenu(){
  background (0);
  fill(255);
  textSize(25);
  text("Number of Credits", 150, 300);
  textSize(25);
  text("Number of Hours Worked", 150, 200);
  textSize(30);
  text("High School 2: Electric Boogalo", 300, 70);
  rect(467,177,40,25);//white square
  rect(385,278,40,25);//white square number two
  rect(525,177,26,26);//  Green square 1
  rect(445,278,26,26);// Green square 2
  rect(560,177,26,26);//Red square 1
  rect(480,278,26,26);//Red square 2
  fill(0, 255, 0);
  triangle(538, 175, 525, 202, 551, 202);//green arrow
  triangle(458,278,445,304,471,304);//green arrow 2
  fill(255,0,0);
  triangle(573, 202, 560, 175, 586, 175);//red arrow
  triangle(493,304,480,278,506,278);//red arrow 2
  fill(0,0,255);
  text(numHoursWork, 470,201);
  fill(0,0,255);
  text(numCredits, 389, 302);
  rectMode(CENTER);
  fill(210);
  rect(width/2, height/1.5, 250, 116); // start button
  fill(0);
  textSize(100);
  text("Start", width/2, height/1.4);
    if(numHoursWork < 0) {
        numHoursWork = 0; 
    }
    if(numCredits < 0) {
        numCredits = 0;    
    }
 }

void mouseClicked() {
  if((mouseX > 525 && mouseX < 551 && mouseY > 177 && mouseY < 203)) {
      numHoursWork += 1; //GREEN ARROW 1
      
    }
  if((mouseX > 560 && mouseX < 586 && mouseY > 177 && mouseY <203)) {
      numHoursWork -= 1; //RED ARROW 1
    }
  
  if(mouseX > 445 && mouseX < 471 && mouseY > 278 && mouseY < 304) {
      numCredits += 1;//GREEN ARROW 2
   }
   if(mouseX > 480 && mouseX < 506 && mouseY > 278 && mouseY < 304) {
      numCredits -= 1; //ReD ARROW 2
   }
   if(mouseX >= width/2 - 125 && mouseX <= width/2 + 125 && mouseY > 550 && mouseY < 666) {
      menuCompleted = true;
   }
}
void getGrades() {
  int value = 0;  
  for(int i = 0; i < currentWeek; i++)
    value += weekGrade[i];
  grades = value / gradesMax;
}
