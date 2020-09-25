import java.util.*;
import beads.*;
import java.util.Arrays;

//Initialise variables
int screen = 0;
int monthDays = 31;
String[] weekDays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int currentMonth;
int currentYear = 2020;
float plannerWidth = 0;
int rowCounter = 0;
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
Table table;

//Gifs
WI wi;

//Audio
AudioContext ac;

float posX = 200, posY = 400;
float iconX = 45, iconY = iconX;
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
    textSize(16);
    textAlign(RIGHT, BOTTOM);
    text(i + 1, x + boxWidth / 3, y + boxHeight / 3);
    
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
    image(wi.clear[frameCount%14], posX+130, posY/2 -25, iconX, iconY); //Day 1 icon
    image(wi.clear[frameCount%14], posX+135+boxWidth, posY/2 -25, iconX, iconY); //Day 2 icon
    image(wi.clear[frameCount%14], posX+140 + 2*boxWidth, posY/2 -25, iconX, iconY); //Day 3 icon
    image(wi.sunny[frameCount%19], posX+145 + 3*boxWidth, posY/2 -25, iconX, iconY); //Day 4 icon
    image(wi.clear[frameCount%14], posX/2 - 30, posY/2 -15 + boxHeight, iconX, iconY); //Day 5 icon
    image(wi.sunny[frameCount%19], posX/2 - 25 + boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 6 icon
    image(wi.rainy[frameCount%4], posX/2 - 20 + 2*boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 7 icon
    image(wi.sunny[frameCount%19], posX/2 - 15 + 3*boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 8 icon
    image(wi.sunny[frameCount%19], posX/2 - 10 + 4*boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 9 icon
    image(wi.sunny[frameCount%19], posX/2 - 5 + 5*boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 10 icon
    image(wi.sunny[frameCount%19], posX/2 + 6*boxWidth, posY/2 -15 + boxHeight, iconX, iconY); //Day 11 icon
    image(wi.clear[frameCount%14], posX/2 - 30, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 12 icon
    image(wi.rainy[frameCount%4], posX/2 - 25 + boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 13 icon
    image(wi.thunderstorm[frameCount%10], posX/2 - 20 + 2*boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 14 icon
    image(wi.sunny[frameCount%19], posX/2 - 15 + 3*boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 15 icon
    image(wi.sunny[frameCount%19], posX/2 - 10 + 4*boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 16 icon
    image(wi.sunny[frameCount%19], posX/2 - 5 + 5*boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 17 icon
    image(wi.clear[frameCount%14], posX/2 + 6*boxWidth, posY/2 -10 + 2*boxHeight, iconX, iconY); //Day 18 icon
    image(wi.clear[frameCount%14], posX/2 - 30, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 19 icon
    image(wi.clear[frameCount%14], posX/2 - 25 + boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 20 icon
    image(wi.sunny[frameCount%19], posX/2 - 20 + 2*boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 21 icon
    image(wi.sunny[frameCount%19], posX/2 - 15 + 3*boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 22 icon
    image(wi.clear[frameCount%14], posX/2 - 10 + 4*boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 23 icon
    image(wi.sunny[frameCount%19], posX/2 - 5 + 5*boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 24 icon
    image(wi.sunny[frameCount%19], posX/2 + 6*boxWidth, posY/2 -5 + 3*boxHeight, iconX, iconY); //Day 25 icon
    image(wi.thunderstorm[frameCount%10], posX/2 -30, posY/2 + 4*boxHeight, iconX, iconY); //Day 26 icon
    image(wi.rainy[frameCount%4], posX/2 - 25 + boxWidth, posY/2 + 4*boxHeight, iconX, iconY); //Day 27 icon
    image(wi.rainy[frameCount%4], posX/2 - 20 + 2*boxWidth, posY/2 + 4*boxHeight, iconX, iconY); //Day 28 icon
    image(wi.clear[frameCount%14], posX/2 - 15 + 3*boxWidth, posY/2 + 4*boxHeight, iconX, iconY); //Day 29 icon
    image(wi.sunny[frameCount%19], posX/2 - 10 + 4*boxWidth, posY/2 + 4*boxHeight, iconX, iconY); //Day 30 icon
    image(wi.sunny[frameCount%19], posX/2 - 5 + 5*boxWidth, posY/2 + 4*boxHeight, iconX, iconY); //Day 31 icon

  }
   for(int i = 1; i < daysInMonth; i ++){
    if(screen == i){
      background(255,192,203);
      rect(680,580,20,20);
      table = loadTable(i + ".csv", "header");
      for (TableRow row : table.rows()){
        if(rowCounter < table.getRowCount()){
          String date = row.getString("date");
          String temp= row.getString("temp");
          rowCounter++;
          println(date+" "+temp);
        }
      }
    }
   }
  update();
}

void mousePressed() {
  for(int i = 0; i < monthDays; i ++){
    if(dayOver[i]){
      //background(i*10, i*10, i*10);
      screen = i+1;
      //sound();
    }
  }
  if(overDay(680,580,20,20)){
    screen = 0;
    //sound();
  }
}

void update() {
  for(int i = 0; i < monthDays; i ++){
    if ( overDay(dayX[i], dayY[i], dayWidth, dayHeight) ) {
      dayOver[i] = true;
    }
  }
}

//void sound(){
//  String audioFileName = "/data/button.wav";
//  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample(audioFileName));
  
//  Panner p = new Panner(ac,0);
//  Gain g = new Gain(ac, 2, 0.5);
  
//  p.addInput(player);
//  ac.out.addInput(g);
//  ac.start();
//}

boolean overDay(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
