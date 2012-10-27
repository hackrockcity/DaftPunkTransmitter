class Segment {
  String m_name;
  List<SubSegment> subSegments;
  List<SubSegment> subSegments2;
  PVector m_startPosition;
  PVector m_endPosition;
  boolean rail = false;

  // For rails using the integer "point" system
  Segment(String name, int strip, int offset, int length, int startPoint, int endPoint) {
    m_name = name;
    rail = true;

    SubSegment sub = new SubSegment(name, strip, offset, length, startPoint, endPoint);
    subSegments = new LinkedList<SubSegment>();
    subSegments.add(sub);
  }

  // For Trap segments that span one strip. Negative lengths are strips that run backwards!
  Segment(int num, int strip, int start, int length) {
    SubSegment sub = new SubSegment(num, strip, start, length, 0);
    subSegments = new LinkedList<SubSegment>();
    subSegments.add(sub);
  }

  // For Trap segments that span two strips. Negative lengths are strips that run backwards!
  Segment(int num, int strip1, int start1, int length1, int strip2, int start2, int length2) {
    SubSegment sub1 = new SubSegment(num, strip1, start1, length1, 0);
    SubSegment sub2 = new SubSegment(num, strip2, start2, length2, abs(length1));

    subSegments = new LinkedList<SubSegment>();
    subSegments.add(sub1);
    subSegments.add(sub2);
  }


//  void draw() {
//    strokeWeight(3);
//
//    if (rail && pixelSegments == false) { // Just draw a line. Much easier.
//      SubSegment seg = subSegments.get(0);
//      stroke(currentImage[seg.m_strip + strips*seg.m_start]);  
//      line(seg.pixel_start_position.x, seg.pixel_start_position.y, seg.pixel_end_position.x, seg.pixel_end_position.y);
//     
//    } 
//    
//    else {
//
//      for (SubSegment seg : subSegments) {
//        float amt = 1.0 / abs(seg.m_length);
//
//        for (int x=0; x < abs(seg.m_length); x++) { // Draw all the subsegments!
//          float q = amt * x;
//          if (seg.m_length < 0) { // Change the strip addressing depending on whether we're going backwards (negative length) or not
//            stroke(currentImage[seg.m_strip + strips*seg.m_start + (seg.m_length - x)]);
//          } 
//          else {
//            stroke(currentImage[seg.m_strip + strips*seg.m_start + x]);
//          }
//          
//          PVector point = new PVector(lerp(seg.pixel_start_position.x, seg.pixel_end_position.x, q), lerp(seg.pixel_start_position.y, seg.pixel_end_position.y, q)); 
//          point(point.x, point.y);
//        }
//      }
//    }
//  }

  void draw(color c) {
    stroke(c);
    //println(m_name);
    for (SubSegment sub : subSegments) {
      //println("Strip: " + sub.m_strip + " Offset: " + sub.m_start + " Length: " + sub.m_length);
      line(sub.m_strip, sub.m_start, sub.m_strip, sub.m_start + sub.m_length);
    }
  }
  
  void project() {
    loadPixels();
    //for (SubSegment sub : subSegments) {
    for (int q=0; q < subSegments.size(); q++) {
      float amt = 1.0 / abs(subSegments.get(q).m_length);
      if (subSegments.get(q).m_length > 0) {
        for (int x=0; x < subSegments.get(q).m_length; x++) {
          PVector subpoint = new PVector(lerp(subSegments.get(q).pixel_start_position.x, subSegments.get(q).pixel_end_position.x, amt * x), lerp(subSegments.get(q).pixel_start_position.y, subSegments.get(q).pixel_end_position.y, amt * x));
          pixels[subSegments.get(q).m_strip + (width * (subSegments.get(q).m_start + x))] = pixels[int(subpoint.x) + (width * int(subpoint.y))];
        }
      } else {
        for (int x=abs(subSegments.get(q).m_length); x > 0; x--) {
          PVector subpoint = new PVector(lerp(subSegments.get(q).pixel_start_position.x, subSegments.get(q).pixel_end_position.x, amt * x), lerp(subSegments.get(q).pixel_start_position.y, subSegments.get(q).pixel_end_position.y, amt * x));
          pixels[subSegments.get(q).m_strip + (width * (subSegments.get(q).m_start - x))] = pixels[int(subpoint.x) + (width * int(subpoint.y))];
        }
      }
    }
    updatePixels();
    
  }
}

