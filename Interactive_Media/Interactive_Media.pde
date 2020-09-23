PImage[] sunny = new PImage[19];
PImage[] rainy = new PImage[4];
PImage[] thunderstorm = new PImage[10];

float posX = 200, posY = 400;
float iconX = 100, iconY = iconX;
int frameSpeed = 10;

void setup() {
  size(500, 500);
  smooth();
  frameRate(frameSpeed);
  sunnyIcon();
  rainyIcon();
  thunderIcon();
}

void draw() {
  background(0);
  image(sunny[frameCount%19], posX/2, posY/2, iconX, iconY);
  image(rainy[frameCount%4], posX+100, posY/2, iconX, iconY);
  image(thunderstorm[frameCount%10], posX, posY/3, iconX, iconY);
}

void sunnyIcon() {
  sunny[0] = loadImage("sunny/sunny3.gif");
  sunny[1] = loadImage("sunny/sunny6.gif");
  sunny[2] = loadImage("sunny/sunny9.gif");
  sunny[3] = loadImage("sunny/sunny12.gif");
  sunny[4] = loadImage("sunny/sunny15.gif");
  sunny[5] = loadImage("sunny/sunny18.gif");
  sunny[6] = loadImage("sunny/sunny21.gif");
  sunny[7] = loadImage("sunny/sunny24.gif");
  sunny[8] = loadImage("sunny/sunny27.gif");
  sunny[9] = loadImage("sunny/sunny30.gif");
  sunny[10] = loadImage("sunny/sunny27.gif");
  sunny[11] = loadImage("sunny/sunny24.gif");
  sunny[12] = loadImage("sunny/sunny21.gif");
  sunny[13] = loadImage("sunny/sunny18.gif");
  sunny[14] = loadImage("sunny/sunny15.gif");
  sunny[15] = loadImage("sunny/sunny12.gif");
  sunny[16] = loadImage("sunny/sunny9.gif");
  sunny[17] = loadImage("sunny/sunny6.gif");
  sunny[18] = loadImage("sunny/sunny3.gif");
}

void rainyIcon() {
  rainy[0] = loadImage("rain/rain1.gif");
  rainy[1] = loadImage("rain/rain2.gif");
  rainy[2] = loadImage("rain/rain3.gif");
  rainy[3] = loadImage("rain/rain4.gif");
}

void thunderIcon() {
  thunderstorm[0] = loadImage("thunderstorm/thunderstorm1.gif");
  thunderstorm[1] = loadImage("thunderstorm/thunderstorm2.gif");
  thunderstorm[2] = loadImage("thunderstorm/thunderstorm3.gif");
  thunderstorm[3] = loadImage("thunderstorm/thunderstorm4.gif");
  thunderstorm[4] = loadImage("thunderstorm/thunderstorm5.gif");
  thunderstorm[5] = loadImage("thunderstorm/thunderstorm6.gif");
  thunderstorm[6] = loadImage("thunderstorm/thunderstorm7.gif");
  thunderstorm[7] = loadImage("thunderstorm/thunderstorm8.gif");
  thunderstorm[8] = loadImage("thunderstorm/thunderstorm9.gif");
  thunderstorm[9] = loadImage("thunderstorm/thunderstorm9.gif");
}
