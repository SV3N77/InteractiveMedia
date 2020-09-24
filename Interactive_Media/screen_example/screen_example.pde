int screen = 0;
//Set up the window for the sketch
void setup() {
  size(200, 100);
}
//Do every frame
void draw() {
  background(0);
  fill(255);
  //test which screen you are on
  if(screen == 0) {
    //take action to do whatever you want to do on screen 0
    text("START THE GAME!!!", 20, 50);
  }
  //eat, sleep, rave, repeat:
  if(screen == 1) {
    text("your on level 1", 20, 50);
  }
  if(screen == 2) {
    text("Ooh man onto level 2", 20, 50);
  }
  if(screen == 3) {
    text("YOU HAVE WON!!! Gratz", 20, 50);
  }
}
 
void mousePressed() {
  //Set the screen when whatever happens that you want to happen
  screen = min(screen + 1, 3);
}
