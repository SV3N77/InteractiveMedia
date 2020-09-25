class WI {
  
  PImage[] sunny = new PImage[19];
  PImage[] rainy = new PImage[4];
  PImage[] thunderstorm = new PImage[10];
  PImage[] clear = new PImage[14];
  
  void sunnyIcon() {
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

  void rainyIcon() {
  rainy[0] = loadImage("/data/rain/rain1.gif");
  rainy[1] = loadImage("/data/rain/rain2.gif");
  rainy[2] = loadImage("/data/rain/rain3.gif");
  rainy[3] = loadImage("/data/rain/rain4.gif");
  }

  void thunderIcon() {
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
  
  void clearIcon() {
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
