class RailSegmentBrightnessPattern extends Pattern {
  Segment m_segment = null;
  color m_color;

  RailSegmentBrightnessPattern(int channel, int pitch, int velocity) {
    super(channel, pitch, velocity);
    
    color basecolor;
    float ratio;
    
    if (pitch >= 36 && pitch-36 < LeftRailSegments.size()) {
      m_segment = LeftRailSegments.get(pitch-36);
      
      ratio = (velocity/127.0);
      basecolor = channelColors[channel];
      
      m_color = color(
        red(basecolor)*ratio,
        green(basecolor)*ratio,
        blue(basecolor)*ratio
      );
    }
    else if (pitch == 12 && velocity > 0) {
      println("Change channel " + channel + " red to " + velocity);
      basecolor = channelColors[channel];
      channelColors[channel] = color(velocity*2, green(basecolor), blue(basecolor));
    }
    else if (pitch == 13 && velocity > 0) {
      println("Change channel " + channel + " green to " + velocity);
      basecolor = channelColors[channel];
      channelColors[channel] = color(red(basecolor), velocity*2, blue(basecolor));
    }
    else if (pitch == 14 && velocity > 0) {
      println("Change channel " + channel + " blue to " + velocity);
      basecolor = channelColors[channel];
      channelColors[channel] = color(red(basecolor), green(basecolor), velocity*2);
    }
  }
  
  void draw() {
    if (m_segment != null) {
      m_segment.draw(m_color);    
    }
    
    m_isDone = true;
  }
}

