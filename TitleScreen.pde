int numCredits = 0;
int numHoursWork = 0;

void setup() {
 background(0);
 size(1000,700);
 fill(255);
 textSize(25);
 text("Number of Credits", 150,300);
 textSize(25);
 text("Number of Hours Worked", 150,200);
 textSize(30);
 text("High School 2: Electric Boogalo", 300,30);
 rect(467,177,25,25);//white square
 rect(385,278,25,25);//white square number two
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

}
void draw(){
background (0);
 size(1000,700);
 fill(255);
 textSize(25);
 text("Number of Credits", 150,300);
 textSize(25);
 text("Number of Hours Worked", 150,200);
 textSize(30);
 text("High School 2: Electric Boogalo", 300,30);
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
 if(numHoursWork < 0)
    {
        numHoursWork = 0; 
    }
 if(numCredits < 0)
   {
        numCredits = 0;    
   }
}
 
 

 

 void mouseClicked()
{
  if((mouseX > 525 && mouseX < 551 && mouseY > 177 && mouseY < 203))
  {
      numHoursWork += 1; //GREEN ARROW 1
      
    }
  if((mouseX > 560 && mouseX < 586 && mouseY > 177 && mouseY <203))
    {
      numHoursWork -= 1; //RED ARROW 1
    }
  
  if(mouseX > 445 && mouseX < 471 && mouseY > 278 && mouseY < 304)
   {
         numCredits += 4;//GREEN ARROW 2
   }
   if((mouseX > 480 && mouseX < 506 && mouseY > 278 && mouseY < 304))
   {
         numCredits -= 4; //ReD ARROW 2
   }
}
