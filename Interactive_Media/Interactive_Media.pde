import java.util.*;
//Initialise variables
int screen = 0;
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

float [] dayX;
float [] dayY;
boolean [] dayOver;
boolean homeOver;
float dayWidth = 0;
float dayHeight = 0;
color rectHighlight, circleHighlight;
color currentColour;

int mousePosition;

//Gifs
WI wi;

float posX = 200, posY = 400;
float iconX = 100, iconY = iconX;
int frameSpeed = 10;

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
  homeOver = false;
  
  frameRate(frameSpeed);
  wi = new WI();
  wi.sunnyIcon();
  wi.rainyIcon();
  wi.thunderIcon();
  wi.clearIcon();
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
  dayWidth = boxWidth;
  dayHeight = boxHeight;
  if(screen ==0){
  
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
      
      dayX[i] = x + 3;
      dayY[i] = y + 3;
      dayOver[i] = false;
      
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
    rect(680,580,20,20);
    image(wi.sunny[frameCount%19], posX/2, posY/2, iconX, iconY);
    image(wi.rainy[frameCount%4], posX+100, posY/2, iconX, iconY);
    image(wi.thunderstorm[frameCount%10], posX/2, posY/4, iconX, iconY);
    image(wi.clear[frameCount%14], posX+100, posY/4, iconX, iconY);
  }
  if(screen == 1){
    background(255,192,203);
    rect(680,580,20,20);
  }
  if(screen == 2){
    background(255);
    rect(680,580,20,20);
  }
  update();
}

void mousePressed() {
  for(int i = 0; i < monthDays; i ++){
    if(dayOver[i]){
      //background(i*10, i*10, i*10);
      screen = i+1;
    }
  }
  if(overDay(680,580,20,20)){
    screen = 0;
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
}
