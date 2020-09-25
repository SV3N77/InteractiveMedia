float[] Solar;
float minSolar, maxSolar;
int[] time;

float X1, Y1, X2, Y2;

void setup() 
{
  size(1300, 1000);

  X1 = 50; 
  Y1 = 50;
  X2 = width - 50;  
  Y2 = height - Y1;

  smooth();
  Table myTable = loadTable("1b.csv", "header");

 
  Solar = new float[myTable.getRowCount()];
  time = new int[myTable.getRowCount()];

  int i = 0;
  for (TableRow row : myTable.rows()) {
  Solar[i] = row.getFloat("Solar");
  time[i] = row.getInt("Date");
  i++;
}
 
minSolar = min(Solar);
maxSolar = max(Solar);

} 

void draw() {
  background(0);
  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(X1, Y1, X2, Y2);

  drawGraph(Solar, minSolar, maxSolar);

  fill(255);
  
  drawXLabels();
  drawYLabels();
} 

void drawGraph(float[] data, float yMin, float yMax) 
{
  stroke(0);
  strokeWeight(3);
  beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length, X1, X2);
    float y = map(data[i], yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
} 
void drawYLabels () 
{
  fill(255);
  textSize(12);
  textAlign(LEFT);
  stroke(255);
  for (float i=minSolar; i <= maxSolar; i += 15) {
    float y = map(i, minSolar, maxSolar, Y2, Y1);
    text(floor(i), X1-30, y);
    line(X1, y, X1-5, y);
  }
  textSize(16);
  text("SolarR", X1-45, height/2.3);
} 

void drawXLabels() {
  fill(255);
  stroke(0);
  textSize(13);
  textAlign(CENTER);

  int m = 0;
  for (int i=0; i<time.length; i++) {
    if (time[i] == m) continue;
    m = time[i];
    float x = map(i, 0, time.length, X1, X2);
    text(m, x, Y2+30);
    strokeWeight(0.5);
    line(x, Y2, x, Y1);
  }
  textSize(18);
  textAlign(CENTER, TOP);
  text("Time", width/2, Y2+20);
} 
