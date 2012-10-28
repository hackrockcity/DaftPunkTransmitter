class FlashBoxPattern extends Pattern {
  
  int m_pitch;
  
  FlashBoxPattern(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
    m_pitch = pitch;
    println("Flash pitch " + m_pitch);
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
    
    int base_pitch = m_pitch - 24;
    
    
    
    if((base_pitch/4) >= 0 && (base_pitch/4) < flashColors.length) {
      pushStyle();
      fill(flashColors[base_pitch/4]);
      //fill(100,100,100);
      //rect(0,0,40,160);
      rect(70+(base_pitch%4)*160, 0, 160, height);
      popStyle();
    }
  }
}

