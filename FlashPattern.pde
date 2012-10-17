class FlashPattern extends Pattern {
  
  FlashPattern(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
  }
  
  
  void draw() {
    // Display one flash of color, then end.
    background(color(m_pitch));
    
    m_isDone = true;
  }
}

