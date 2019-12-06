float s = 5;
float w = 700;
float wDelta = 100;
int timeStart = second();
int timeElapsed = second() + 10;
void setup() {
  size(1400, 1000);
  background(0);
}
 void draw() {
  if(millis() > 10000 ){
  exit();
  }
   noStroke();
   fill(255);
   rect(100, 400, 1200, 200);
     fill(255, 0, 0);
    if(w > 500 && w < 710){
      fill(0, 255, 0);
    }
    rect(100, 400, w, 200);
    
    fill(0);
    rect(1300, 0, 500, 800);
    //Causes the bar to continously shrink
    w -= s;
  if(w < 0) {
    w = 0;
  }
   if(w > 1200) {
    w = 1200;
    
  }
  fill(0);
  rect(600, 400, 5, 200);
  rect(800, 400, 5, 200);
  if(w >500 && w <710) {
    
 }
 //Causes the bar to grow everytime the player clicks the mouse
 void mousePressed() {
   w += wDelta;
 }
 
