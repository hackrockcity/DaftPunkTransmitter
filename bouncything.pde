class BouncyThings extends Pattern {
  List<BouncyThing> bouncyThings;
  
  void draw() {
    if(bouncyThings == null) {
      bouncyThings = new LinkedList<BouncyThing>();
      for(int i = 0; i < 10; i++) {
        bouncyThings.add(new BouncyThing(color(random(0,255),random(0,255),random(0,255)),random(0,500),random(0,80)));
      }
    }
    
    for (BouncyThing bt : bouncyThings) {
      bt.draw();
    }
  }
}

class BouncyThing extends Pattern {
  int step = 0;
  int rwidth = 550;
  int rheight = 80;

  color c;
  float xPos = 20;
  float yPos = 20;
  float xVelocity = 30;
  float yVelocity = 30;
  
  float rSize = 60;
  
  BouncyThing(color c_, float xPos_, float yPos_) {
    xPos = xPos_;
    yPos = yPos_;
    c = c_;
    
    xVelocity = random(-15,15);
    yVelocity = random(-15,15);
  }
  
  void draw() {
    
    fill(c);
    rect(xPos+ 80, yPos, rSize, rSize);
    
    xPos += xVelocity;
    if(xPos > rwidth + rSize) {
      xVelocity = -random(5,15);
    }
    if(xPos < 0) {
      xVelocity = random(5,15);
    }

    yPos += yVelocity;
    if(yPos > rheight + rSize) {
      yVelocity = -random(5,15);
    }
    if(yPos < 0) {
      yVelocity = random(5,15);
    }

  }
}

