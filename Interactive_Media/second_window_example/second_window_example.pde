int mousePosition;
void settings() {
  size(640, 480, P2D);
}
void draw() {
  background(0);
  mousePosition=mouseX;
  text("Current time is "+millis()/1000, 0, 15);
}

void mousePressed() {
  runSecondWindow();
}


void runSecondWindow() {
  String[] args = {
    "test" //First argument seems to be eaten...?
    , 
    "Argument #1: launched at "+(millis()/1000)
    , 
    "Argument #2: mouse position was "+mouseX+" and "+mouseY
  };
  PApplet.runSketch(args, new NewWindowThing());
}


public class NewWindowThing extends PApplet {
  void settings() {
    size(320, 120); //Don't set this to P2D - if you do, closing main window will make a ThreadDeath.
  }
  void setup() {
    surface.setTitle("Hi. "+random(1));
  }
  void draw() {
    background(128, 64, 128);
    fill(255);
    text("mousePosition: "+mousePosition, 0, 15);
    text("Arguments:", 0, 30);
    if (args!=null) { //Go through arguments
      for (int i=0; i<args.length; i++) {
        text(args[i], 0, 45+15*i);
      }
    }
  }
}
