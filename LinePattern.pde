class LinePattern extends Pattern {
  
  LinePattern(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
  }
  
  
  void draw() {
    // Display one flash of color, then end.
    stroke(color(255,0,0));
    line(0,m_pitch, displayWidth, m_pitch);
    
    m_isDone = true;
  }
}

