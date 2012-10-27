class RGBRoutine extends Pattern {
  int color_angle = 0;
  
  void draw() {
    background(0);
  
    for (int row = 0; row < height; row++) {
      //for (int col = 0; col < width; col++) {
        int r = (((row)*2          + 100*1/width   + color_angle  +   0)%100)*(255/100);
        int g = (((row)*2          + 100*1/width   + color_angle  +  33)%100)*(255/100);
        int b = (((row)*2          + 100*1/width   + color_angle  +  66)%100)*(255/100);
        
        stroke(r,g,b);
        //point(,row);
        line(displayWidth + 1, row, width, row);
      //}
    }
    
    color_angle = (color_angle+10);//%255;


//    long frame = frameCount - modeFrameStart;
//    if (frame > FRAMERATE*TYPICAL_MODE_TIME) {
//      newMode();
//    }
  }
}
