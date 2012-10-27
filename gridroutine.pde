class GridRoutine extends Pattern {
  int step = 0;
  int rwidth = 700;
  int rheight = 500;

  int stepLength = 20;
  int stepSize = 4;
  
  void draw() {
    //    background(0);

    for (int row = step - stepLength; row < height; row+=stepLength) {
      stroke(255);
      rect(displayWidth + 1, row, rwidth, 2); 
    }
    
    for (int col = step; col < width; col+=stepLength) {
      stroke(255);
      rect(displayWidth + col, 0, 2, height); 
    }


    step = (step+stepSize)%stepLength;
    println(step);
  }
}

