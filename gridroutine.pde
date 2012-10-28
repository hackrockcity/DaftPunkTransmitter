class GridRoutine extends Pattern {
  int step = 0;
  int rwidth = 700;
  int rheight = 500;

  int stepLength = 200;
  int stepSize = 8;
  int gridWidth = 20;
  
  void draw() {
    //    background(0);

//    for (int row = step - stepLength; row < height; row+=stepLength) {
//      stroke(255);
//      rect(displayWidth + 1, row, rwidth, gridWidth); 
//    }
    
    for (int col = step; col < width; col+=stepLength) {
      stroke(255);
      fill(255);
      rect(displayWidth + col, 0, gridWidth, height); 
    }


    step = (step+stepSize)%stepLength;
    println(step);
  }
}

