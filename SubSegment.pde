class SubSegment {
  public int m_strip;
  public int m_start;
  public int m_length;

  PVector pixel_start_position; //post scaled
  PVector pixel_end_position;
  
  // For rails
  SubSegment(String name, int strip, int offset, int length, int startPoint, int endPoint) {
    m_strip = strip;
    m_start = offset;
    m_length = length;

    pixel_start_position = getPositionFromPoint(startPoint);
    pixel_end_position   = getPositionFromPoint(endPoint);
  }

  // For Trapazoids
  SubSegment(int num, int strip, int start, int length, int offset) {
    m_strip = strip;
    m_start = start;
    m_length = length;

    PVector startPoint = new PVector(10 - num, num); //pixel space
    startPoint.add(new PVector(offset, 0)); // Add in the offset, this is for trap segments
                                            // that span two strips
    
    PVector endPoint = startPoint.get();
    endPoint.add(new PVector(abs(length), 0)); 

    pixel_start_position = getPositionFromPoint(startPoint);
    pixel_end_position   = getPositionFromPoint(endPoint);
  }

  // For rails that use point positioning
  PVector getPositionFromPoint(int point) {
    float xScale = 70;
    float yScale = 70;
    float xOffset = 5;
    float yOffset = 5;

    float x;
    float y;

    if (point >= 0 && point <= 9) {
      x = point;
      y = 0;
    }
    else if (point < 19) {
      x = (point - 10) + .5;
      y = 1.11;
    }
    else if (point < 29) {
      x = (point - 20) + 2;
      y = 2.22;
    } 
    else {
      x = (point - 30) + 2;
      y = 3.33;
    }

    return new PVector(x*xScale + xOffset, y*yScale + yOffset);
  }
  
  // For traps that use PVector positioning
  PVector getPositionFromPoint(PVector point) {

    PVector scale = new PVector(5, 10);
    PVector offset = new PVector(0, 0);

    PVector out = point.get();
    out.mult(scale);
    out.add(offset);

    return out;
  }
}

