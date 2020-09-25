
// Sketch 5-5e: Visualizing Time Series (AAPL Stock prices)
float[] temp;
float minTemp, maxTemp;

int[] mm;

float X1, Y1, X2, Y2;

void setup() {

  // drawing setup
  size(600, 400);

  X1 = 50; 
  Y1 = 50;
  X2 = width - 50; 
  Y2 = height - Y1;

  smooth();

  // Read the data file...
  Table myTable = loadTable("1.csv", "header");

  // How long is the dataset
  temp = new float[myTable.getRowCount()];
  mm = new int[myTable.getRowCount()];

  // Parse the needed data
  int i = 0;
  for (TableRow row : myTable.rows()) {
    // get the closing price of stock, and month
    temp[i] = row.getFloat("date");
    mm[i] = row.getInt("temp");
    i++;
  }
 

  // determine min and max stock price for the year
  minTemp = min(temp);
  maxTemp = max(temp);

} // setup()

void draw() {
  background(0);

  // draw plot bounding box
  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(X1, Y1, X2, Y2);

  drawGraph(temp, minTemp, maxTemp);
  
  // draw legend
  // title
  fill(255);
  

  // axis labels
  drawXLabels();
  drawYLabels();
} // draw()

void drawGraph(float[] data, float yMin, float yMax) {
  stroke(0);
  strokeWeight(1);
  beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(data[i], yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
} // drawGraph()



void drawYLabels () {
  fill(255);
  textSize(10);
  textAlign(DOWN);
  stroke(255);
  for (float i=minTemp; i <= maxTemp; i += 10) {
    float y = map(i, minTemp, maxTemp, Y2, Y1);
    text(floor(i), X1-10, y);
    line(X1, y, X1-5, y);
  }
  textSize(18);
  text("temp", X1-40, height/2);
} // drawYLabels()

void drawXLabels() {
  fill(255);
  stroke(0);
  textSize(10);
  textAlign(CENTER);

  int m = 0;
  for (int i=0; i<mm.length; i++) {
    if (mm[i] == m) continue;
    m = mm[i];
    float x = map(i, 0, mm.length, X1, X2);
    text(m, x, Y2+10);
    strokeWeight(0.3);
    line(x, Y2, x, Y1);
  }
  textSize(18);
  textAlign(CENTER, TOP);
  text("Date", width/2, Y2+10);
} // drawXLabels()
