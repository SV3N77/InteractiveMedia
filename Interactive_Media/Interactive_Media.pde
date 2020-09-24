import java.util.*;
//Initialise variables
int monthDays = 31;
String[] weekDays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int currentMonth;
int currentYear = 2020;
float plannerWidth = 0;

float margin = 50;
float topLabelMargin = 100;
float calendarWidth = width - plannerWidth - (margin * 2);
float calendarHeight = height - (margin * 2) - topLabelMargin;
float spacing = 5;
//Gifs 
PImage[] sunny = new PImage[19];
PImage[] rainy = new PImage[4];
PImage[] thunderstorm = new PImage[10];

float posX = 200, posY = 400;
float iconX = 100, iconY = iconX;
int frameSpeed = 10;

void setup(){
  size(700, 600);
  smooth();
  
  textFont(createFont("Georgia", 12));
  textAlign(CENTER, CENTER);

}

void draw(){
  
 String monthName = "July";
float [] dayX;
float [] dayY;
boolean [] dayOver;
float dayWidth = 0;
float dayHeight = 0;
color rectHighlight, circleHighlight;
color currentColour;

int mousePosition;

void setup(){
  size(700, 600);
  smooth();
  textFont(createFont("Georgia", 12));
  textAlign(CENTER, CENTER);
  
  dayX = new float[31];
  dayY = new float[31];
  dayOver = new boolean[31];
  for(int i = 0; i < monthDays; i ++){
    dayOver[i] = false;
  }
}

void draw(){
  String monthName = "July";
  int daysInMonth = monthDays;
  int dayOfMonth = -1;
  
  int startingDayOfMonth = 3;
  
  //Celendar Metrics
  int numRows = ceil((startingDayOfMonth + daysInMonth) / 7);
  margin = 50;
  topLabelMargin = 100;
  calendarWidth = width - plannerWidth - (margin * 2);
  calendarHeight = height - (margin *3) - topLabelMargin;
  spacing = 5;
  float boxWidth = (calendarWidth - (6 * spacing)) / 7;
  float boxHeight = (calendarHeight - ((numRows - 1) * spacing)) / numRows;
  
  background(102);
   fill(255);
  dayWidth = boxWidth;
  dayHeight = boxHeight;
  
  background(102);
  //background(currentColour);
  fill(255);
  stroke(204);
  textSize(42);
  
  text(monthName + " " + currentYear, (width - plannerWidth) / 2, margin + topLabelMargin / 10 * 3);
  
  fill(204);
  textSize(12);
  
  for(int i = 0; i < weekDays.length; i ++)
    text(weekDays[i], margin + (spacing * i) + (boxWidth * i) + boxWidth / 2, margin + topLabelMargin / 10 * 7);
  
  line(margin, margin + topLabelMargin / 10 * 8.5, width - plannerWidth - margin, margin + topLabelMargin / 10 * 8.5);
  
  stroke(0);
    float xoff = startingDayOfMonth;
  float yoff = 0;
  for(int i = 0; i < daysInMonth; i ++) {
    
    float x = margin + (spacing * xoff) + (boxWidth * xoff);
    float y = margin + topLabelMargin + (spacing * yoff) + (boxHeight * yoff);
    
    noStroke();
    fill(51);
    
    rect(x + 3, y + 3, boxWidth, boxHeight);
    
    stroke(0);
    if((i + 1) == dayOfMonth) fill(255);
    else fill(204);
    
    rect(x, y, boxWidth, boxHeight);
    
    fill(0);
    textSize(24);
    
    text(i + 1, x + boxWidth / 2, y + boxHeight / 2);
    
    textSize(9);
    
    xoff = (xoff + 1) % 7;
    if(xoff == 0) yoff ++;
  }
  
  noStroke();
  
  if(plannerWidth > 50) {
    fill(51);
    
    rect(width - plannerWidth + 3, margin + topLabelMargin + 3, plannerWidth - margin, height - margin * 2 - topLabelMargin);
    
    stroke(0);
    fill(204);
    
    rect(width - plannerWidth, margin + topLabelMargin, plannerWidth - margin, height - margin * 2 - topLabelMargin);
  }
<<<<<<< HEAD


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
    update();
}

void mousePressed() {
  for(int i = 0; i < monthDays; i ++){
    if(dayOver[i]){
      background(i*10, i*10, i*10);
    }
  }
}

void update() {
  for(int i = 0; i < monthDays; i ++){
    if ( overDay(dayX[i], dayY[i], dayWidth, dayHeight) ) {
      dayOver[i] = true;
    }
  }
}

boolean overDay(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
=======
>>>>>>> parent of 74b9157... Merge branch 'Ivan' into Development
}
