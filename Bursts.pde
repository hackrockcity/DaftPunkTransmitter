class Bursts extends Pattern {
  int NUMBER_OF_BURSTS = 26;
  Burst[] bursts;
  
  Bursts() {
  
  }
  
  void setup(PApplet parent) {
    super.setup(parent);
    bursts = new Burst[NUMBER_OF_BURSTS];
    for (int i = 0; i<NUMBER_OF_BURSTS; i++) {
      bursts[i] = new Burst();
    }
  }

  void reset() {
  }
  
  void draw()
  {
      //background(0,0,20);
  
    for (int i=0; i<NUMBER_OF_BURSTS; i++) {
      bursts[i].draw();
    }
  
//    if (frameCount - modeFrameStart > FRAMERATE*TYPICAL_MODE_TIME) {
//      newMode();
//    }
  }
}


class Burst {
  float x;
  float y;
  float xv;
  float yv;
  float d;
  float maxd;
  float speed;
  int intensity;
  
  float r;
  float g;
  float b;

  public Burst()
  {
    init();
  }

  public void reset()
  {
    r = random(128)+128;
    g = random(128)+128;
    b = random(128)+128;
    //r = random(128);
    //g = random(118);
    //b = random(128);
   
    x = random(displayWidth + 1, 800);
    y = random(height);

    float max_speed = 2;
    xv = random(max_speed) - max_speed/2;
    yv = random(max_speed) - max_speed/2;
    
    maxd = random(6);
    speed = random(5)/10 + 0.4;
    d = 0;
    intensity = 255;
  }

  public void init()
  {
    reset();
  }
  
  public void draw_ellipse(float x, float y, float widt, float heigh, color c) {
    while(widt > 1 && heigh > 1) {
      pushStyle();
      float target_brightness = random(.8,1.5);
      c = color(red(c)*target_brightness, green(c)*target_brightness, blue(c)*target_brightness);
      fill(c);
      stroke(c);
      x = constrain(x, displayWidth + widt, 800);
      //y = constrain(y, displayHeight + heigh, height);
      ellipse(x, y, widt, heigh);
      widt -= 1;
      heigh -= 1;
      popStyle();
    }
  }
  
  public void draw()
  {    
    // Draw multiple elipses, to handle wrapping in the y direction.
//    draw_ellipse(x, y,       d*(.3*y/height)*5, d*3, color(r,g,b));
      draw_ellipse(x, y,       d*5, d*5, color(r,g,b));
//    draw_ellipse(x-displayWidth, y, d*(.5-.3*y/displayHeight), d*3, color(r,g,b));
//    draw_ellipse(x+displayWidth, y, d*(.5-.3*y/displayHeight), d*3, color(r,g,b));
    
    d+= speed;
    if (d > maxd) {
      // day
      r -= 2;
      g -= 2;
      b -= 2;
      intensity -= 15;
      //night
//      r -= 1;
//      g -= 1;
//      b -= 1;
//      intensity -= 3;
    }
    
    // add speed, try to scale slower at the bottom...
    x +=xv*(height - y/3)/height;
    y +=yv*(height - y/3)/height;

    if (intensity <= 0) {
      reset();
    }
   
//    long frame = frameCount - modeFrameStart;
//    if (frame > FRAMERATE*TYPICAL_MODE_TIME) {
//      newMode();
//    }
  }
}

