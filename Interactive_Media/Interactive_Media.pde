
WI wi;

float posX = 200, posY = 400;
float iconX = 100, iconY = iconX;
int frameSpeed = 10;

void setup() {
  size(500, 500);
  smooth();
  frameRate(frameSpeed);
  wi = new WI();
  wi.sunnyIcon();
  wi.rainyIcon();
  wi.thunderIcon();
}

void draw() {
  background(0);
  image(wi.sunny[frameCount%19], posX/2, posY/2, iconX, iconY);
  image(wi.rainy[frameCount%4], posX+100, posY/2, iconX, iconY);
  image(wi.thunderstorm[frameCount%10], posX, posY/3, iconX, iconY);
}
