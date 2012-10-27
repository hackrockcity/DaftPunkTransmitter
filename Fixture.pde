class Fixture {

  private List<Segment> segments;
  private PVector point;
  int fix_width;
  int fix_height;

  Fixture(List<Segment> in_segs, PVector in_point) {
    segments = in_segs;
    point = in_point;
    
    for (Segment segment : segments) { 
      for (SubSegment sub : segment.subSegments) {
        sub.pixel_start_position.add(in_point);
        sub.pixel_end_position.add(in_point);
        if (sub.pixel_end_position.x > fix_width) fix_width = int(sub.pixel_end_position.x);
        if (sub.pixel_end_position.y > fix_height) fix_height = int(sub.pixel_end_position.y);
      }
    }
  }

  void project() {
    for (Segment segment : segments) {
       segment.project();
    }
    
    pushStyle();
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(point.x - 5, point.y - 5, (fix_width - point.x) + 5, (fix_height - point.y) + 5);
    popStyle();
  }
}

