class FlashPattern extends Pattern {
  
  int m_pitch;
  
  FlashPattern(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
    m_pitch = pitch;
  }
  
  void draw() {
    // Display one flash of color, then end.
    
  color[] flashColors = new color[] {
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(0, 255, 255), 
    color(255, 0, 255), 
    color(255, 255, 255), 
    color(255, 64, 64), 
    color(255, 127, 0), 
    color(0, 255, 127), 
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(0, 255, 255), 
    color(255, 0, 255)
  };
    
    if((m_pitch - 24) >= 0 && (m_pitch - 24) < flashColors.length) {
      pushStyle();
      fill(flashColors[m_pitch - 24]);
      //fill(100,100,100);
      //rect(0,0,40,160);
      rect(41, 0, 800, height);
      popStyle();
    }
  }
}

