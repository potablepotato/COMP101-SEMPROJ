int numCredits = 0;
int numHoursWork = 0;

void setup() {
 background (0);
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
 rect(525,177,26,26);
 rect(445,278,26,26);
 rect(560,177,26,26);
 rect(480,278,26,26);
 fill(0, 255, 0);
 triangle(538, 175, 525, 202, 551, 202);
 triangle(458,278,445,304,471,304);
 fill(255,0,0);
 triangle(573, 202, 560, 175, 586, 175);
 triangle(493,304,480,278,506,278);
 if(mousePressed() && mouseX>=525&&mouseX<551&&mouseY>177&&mouseY<=203)
 {
   numHoursWork += 1; 
 }
 fill(0,255,255);
 text(numHoursWork,0,0);
}
