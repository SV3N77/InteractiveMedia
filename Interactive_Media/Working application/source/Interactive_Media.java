import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 
import java.util.*; 
import beads.*; 
import java.util.Arrays; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Interactive_Media extends PApplet {











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
int rectHighlight, circleHighlight;
int currentColour;

float[] Temp;
float minTemp, maxTemp;
int[] time;

float[] Solar;
float minSolar, maxSolar;
int[]timeSolar;

float X1, Y1, X2, Y2;
float A1, B1, A2, B2;

int mousePosition;
Table table;
Table table2;

//Gifs
WI wi;

//Audio
Minim minim;
AudioPlayer player;

float posX = 200, posY = 400;
float iconX = 55, iconY = iconX;
int frameSpeed = 10;

public void setup(){
  
  
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

public void draw(){
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
    textAlign(CENTER, CENTER);
    rectMode(CORNER);
    background(102);
    fill(255);
    stroke(204);
    textSize(42);
    strokeWeight(3);
    
    text(monthName + " " + currentYear, (width - plannerWidth) / 2, margin + topLabelMargin / 10 * 3);
    fill(204);
    textSize(12);
    
    for(int i = 0; i < weekDays.length; i ++)
      text(weekDays[i], margin + (spacing * i) + (boxWidth * i) + boxWidth / 2, margin + topLabelMargin / 10 * 7);
    
    line(margin, margin + topLabelMargin / 10 * 8.5f, width - plannerWidth - margin, margin + topLabelMargin / 10 * 8.5f);
    
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
  fill(0);
  rect(10,10,47,27);
  fill(255);
  rect(10,10,45,25);
  textSize(12);
  fill(0);
  text("Home", 50,30);
  
    image(wi.clear[frameCount%14], posX+150 + boxWidth, posY/2 -30, iconX, iconY); //Day 1 icon
    image(wi.clear[frameCount%14], posX+155+ 2*boxWidth, posY/2 -30, iconX, iconY); //Day 2 icon
    image(wi.clear[frameCount%14], posX+160 + 3*boxWidth, posY/2 -30, iconX, iconY); //Day 3 icon
    image(wi.sunny[frameCount%19], posX+165 + 4*boxWidth, posY/2 -30, iconX, iconY); //Day 4 icon
    image(wi.clear[frameCount%14], posX/2 - 12, posY/2 -25 + boxHeight, iconX, iconY); //Day 5 icon
    image(wi.sunny[frameCount%19], posX/2 - 7 + boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 6 icon
    image(wi.rainy[frameCount%4], posX/2 - 2 + 2*boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 7 icon
    image(wi.sunny[frameCount%19], posX/2 + 3 +3*boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 8 icon
    image(wi.sunny[frameCount%19], posX/2 + 8 + 4*boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 9 icon
    image(wi.sunny[frameCount%19], posX/2 + 13 + 5*boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 10 icon
    image(wi.sunny[frameCount%19], posX/2 + 18 + 6*boxWidth, posY/2 -25 + boxHeight, iconX, iconY); //Day 11 icon
    image(wi.clear[frameCount%14], posX/2 - 12, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 12 icon
    image(wi.rainy[frameCount%4], posX/2 - 7 + boxWidth, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 13 icon
    image(wi.thunderstorm[frameCount%10], posX/2 - 2 + 2*boxWidth, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 14 icon
    image(wi.sunny[frameCount%19], posX/2 + 3 + 3*boxWidth, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 15 icon
    image(wi.sunny[frameCount%19], posX/2 + 8 + 4*boxWidth, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 16 icon
    image(wi.sunny[frameCount%19], posX/2 + 13 + 5*boxWidth, posY/2 -20 + 2*boxHeight, iconX, iconY); //Day 17 icon
    image(wi.clear[frameCount%14], posX/2 + 18 +6*boxWidth, posY/2 - 20 + 2*boxHeight, iconX, iconY); //Day 18 icon
    image(wi.clear[frameCount%14], posX/2 - 12, posY/2 -15 + 3*boxHeight, iconX, iconY); //Day 19 icon
    image(wi.clear[frameCount%14], posX/2 - 7 + boxWidth, posY/2 -15 + 3*boxHeight, iconX, iconY); //Day 20 icon
    image(wi.sunny[frameCount%19], posX/2 - 2 + 2*boxWidth, posY/2 -15 + 3*boxHeight, iconX, iconY); //Day 21 icon
    image(wi.sunny[frameCount%19], posX/2 + 3 + 3*boxWidth, posY/2 - 15 + 3*boxHeight, iconX, iconY); //Day 22 icon
    image(wi.clear[frameCount%14], posX/2 + 8 + 4*boxWidth, posY/2 - 15 + 3*boxHeight, iconX, iconY); //Day 23 icon
    image(wi.sunny[frameCount%19], posX/2 + 13 + 5*boxWidth, posY/2 - 15 + 3*boxHeight, iconX, iconY); //Day 24 icon
    image(wi.sunny[frameCount%19], posX/2 + 18 + 6*boxWidth, posY/2 - 15 + 3*boxHeight, iconX, iconY); //Day 25 icon
    image(wi.thunderstorm[frameCount%10], posX/2 - 12, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 26 icon
    image(wi.rainy[frameCount%4], posX/2 - 7 + boxWidth, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 27 icon
    image(wi.rainy[frameCount%4], posX/2 - 2 + 2*boxWidth, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 28 icon
    image(wi.clear[frameCount%14], posX/2 + 3 + 3*boxWidth, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 29 icon
    image(wi.sunny[frameCount%19], posX/2 + 8 + 4*boxWidth, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 30 icon
    image(wi.sunny[frameCount%19], posX/2 + 13 + 5*boxWidth, posY/2 - 10 + 4*boxHeight, iconX, iconY); //Day 31 icon

  }
  
  for(int i = 1; i < daysInMonth + 1; i ++){
    if(screen == i){
      
      //Temp Graph
      background(0);
      rectMode(CORNER);
      noStroke();
      fill(255);
      
      X1 = 50; 
      Y1 = 50;
      X2 = width/2 - 100;  
      Y2 = height - 1.5f*Y1;
      rect(X1, Y1, X2, Y2);
    
      fill(255);
     
      table = loadTable(i + ".csv", "header");
          
      Temp = new float[table.getRowCount()];
      time = new int[table.getRowCount()];
    
      int m = 0;
      for (TableRow row : table.rows()) {
        Temp[m] = row.getFloat("temp");
        time[m] = row.getInt("date");
        m++;
        drawXLabels();
        drawYLabels();
      }
      
      minTemp = min(Temp);
      maxTemp = max(Temp);
     
      drawLineGraph(Temp, minTemp, maxTemp);
      
      //Solar Graph
      
      rectMode(CORNER);
      noStroke();
      fill(255);
      
      rect(A1, B1, A2, B2);
      A1 = width/2; 
      B1 = 50;
      A2 = width/2 - 25;  
      B2 = height - 1.5f*B1;
      
      
    
      fill(255);
     
      table = loadTable(i + "b.csv", "header");
          
      Solar = new float[table.getRowCount()];
      timeSolar = new int[table.getRowCount()];
    
      int p = 0;
      for (TableRow row : table.rows()) {

        Solar[p] = row.getFloat("Solar");
        timeSolar[p] = row.getInt("Date");
        p++;
        drawXLabels();
        drawYSolarLabels();
      }
      
      minSolar = min(Solar);
      maxSolar = max(Solar);
     
      drawSolarGraph(Solar, minSolar, maxSolar);
    }
  }
  
  rectMode(CORNER);
  strokeWeight(3);
  fill(0);
  rect(10,10,47,27);
  fill(255);
  rect(10,10,45,25);
  textSize(12);
  fill(0);
  textAlign(LEFT);
  text("Home", 18,26);
  update();
}

public void mousePressed() {
  for(int i = 0; i < monthDays; i ++){
    if(dayOver[i]){
      screen = i+1;
      sound();
    }
  }
  if(overDay(10,10,45,25)){
    screen = 0;
    sound();
  }
}

public void update() {
  for(int i = 0; i < monthDays; i ++){
    if ( overDay(dayX[i], dayY[i], dayWidth, dayHeight) ) {
      dayOver[i] = true;
    }
  }
}

public void sound(){
  minim = new Minim(this);
  player = minim.loadFile("/data/button.mp3");
  player.play();
  player.setGain(-30);
}

public boolean overDay(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

public void drawLineGraph(float[] data, float yMin, float yMax) 
{
  stroke(0);
  strokeWeight(3);
  beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(data[i], yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
}

public void drawSolarGraph(float[] data, float yMin, float yMax) 
{
  stroke(0);
  strokeWeight(3);
  beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length, 600, 150);
    float y = map(data[i], yMin, yMax, B2, B1);
    vertex(x + 350, y);
  }
  endShape();
  
}



public void drawYLabels () 
{
  fill(255);
  textSize(12);
  textAlign(LEFT);
  stroke(255);
 for (float i=minTemp; i <= maxTemp; i += 1) {
    float y = map(i, minTemp, maxTemp, Y2, Y1);
    text(floor(i), X1-30, y);
    line(X1, y, X1-5, y);
  }
  textSize(16);
  text("Temp", X1-45, height/12);
} 

public void drawYSolarLabels () 
{
  fill(255);
  textSize(12);
  textAlign(LEFT);
  stroke(255);
 for (float i=minSolar; i <= maxSolar; i += 15) {
    float y = map(i, minSolar, maxSolar, B2, B1);
    text(floor(i), A1-30, y);
    line(A1, y, A1-5, y);
  }
  textSize(16);
  text("SolarR", A1-40, height/12 - 5);
}

public void drawXLabels() {
  fill(255);
  stroke(0);
  textSize(13);
  textAlign(RIGHT);
  
  textSize(16);
  textAlign(CENTER, TOP);
  text("Time(0~23)", width - 75, Y2 + 55);
} 

 
class WI {
  
  PImage[] sunny = new PImage[19];
  PImage[] rainy = new PImage[4];
  PImage[] thunderstorm = new PImage[10];
  PImage[] clear = new PImage[14];
  
  public void sunnyIcon() {
  sunny[0] = loadImage("/data/sunny/sunny3.gif");
  sunny[1] = loadImage("/data/sunny/sunny6.gif");
  sunny[2] = loadImage("/data/sunny/sunny9.gif");
  sunny[3] = loadImage("/data/sunny/sunny12.gif");
  sunny[4] = loadImage("/data/sunny/sunny15.gif");
  sunny[5] = loadImage("/data/sunny/sunny18.gif");
  sunny[6] = loadImage("/data/sunny/sunny21.gif");
  sunny[7] = loadImage("/data/sunny/sunny24.gif");
  sunny[8] = loadImage("/data/sunny/sunny27.gif");
  sunny[9] = loadImage("/data/sunny/sunny30.gif");
  sunny[10] = loadImage("/data/sunny/sunny27.gif");
  sunny[11] = loadImage("/data/sunny/sunny24.gif");
  sunny[12] = loadImage("/data/sunny/sunny21.gif");
  sunny[13] = loadImage("/data/sunny/sunny18.gif");
  sunny[14] = loadImage("/data/sunny/sunny15.gif");
  sunny[15] = loadImage("/data/sunny/sunny12.gif");
  sunny[16] = loadImage("/data/sunny/sunny9.gif");
  sunny[17] = loadImage("/data/sunny/sunny6.gif");
  sunny[18] = loadImage("/data/sunny/sunny3.gif");
  }

  public void rainyIcon() {
  rainy[0] = loadImage("/data/rain/rain1.gif");
  rainy[1] = loadImage("/data/rain/rain2.gif");
  rainy[2] = loadImage("/data/rain/rain3.gif");
  rainy[3] = loadImage("/data/rain/rain4.gif");
  }

  public void thunderIcon() {
  thunderstorm[0] = loadImage("/data/thunderstorm/thunderstorm1.gif");
  thunderstorm[1] = loadImage("/data/thunderstorm/thunderstorm2.gif");
  thunderstorm[2] = loadImage("/data/thunderstorm/thunderstorm3.gif");
  thunderstorm[3] = loadImage("/data/thunderstorm/thunderstorm4.gif");
  thunderstorm[4] = loadImage("/data/thunderstorm/thunderstorm5.gif");
  thunderstorm[5] = loadImage("/data/thunderstorm/thunderstorm6.gif");
  thunderstorm[6] = loadImage("/data/thunderstorm/thunderstorm7.gif");
  thunderstorm[7] = loadImage("/data/thunderstorm/thunderstorm8.gif");
  thunderstorm[8] = loadImage("/data/thunderstorm/thunderstorm9.gif");
  thunderstorm[9] = loadImage("/data/thunderstorm/thunderstorm9.gif");
  }
  
  public void clearIcon() {
    clear[0] = loadImage("/data/clear/clear3.gif");
    clear[1] = loadImage("/data/clear/clear6.gif");
    clear[2] = loadImage("/data/clear/clear9.gif");
    clear[3] = loadImage("/data/clear/clear12.gif");
    clear[4] = loadImage("/data/clear/clear15.gif");
    clear[5] = loadImage("/data/clear/clear18.gif");
    clear[6] = loadImage("/data/clear/clear21.gif");
    clear[7] = loadImage("/data/clear/clear24.gif");
    clear[8] = loadImage("/data/clear/clear21.gif");
    clear[9] = loadImage("/data/clear/clear18.gif");
    clear[10] = loadImage("/data/clear/clear15.gif");
    clear[11] = loadImage("/data/clear/clear12.gif");
    clear[12] = loadImage("/data/clear/clear9.gif");
    clear[13] = loadImage("/data/clear/clear6.gif");
  }
  
 
}
  public void settings() {  size(1000, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Interactive_Media" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
