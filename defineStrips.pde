// Share this between the transmitter and simulator.

void defineStrips() {
  leftRail = Collections.synchronizedList(new LinkedList<RailSegment>());
  leftRail.add(new RailSegment("A2", 0, 29, 24));
  leftRail.add(new RailSegment("A3", 0, 55, 24));
  leftRail.add(new RailSegment("A4", 0, 81, 25));
  leftRail.add(new RailSegment("A5", 0, 107, 25));
  leftRail.add(new RailSegment("A6", 0, 133, 24));
  leftRail.add(new RailSegment("B1", 6, 0, 24));
  leftRail.add(new RailSegment("B2", 6, 26, 23));
  leftRail.add(new RailSegment("B3", 6, 52, 24));
  leftRail.add(new RailSegment("B4", 6, 78, 24));
  leftRail.add(new RailSegment("B5", 6, 104, 24));
  leftRail.add(new RailSegment("B6", 6, 130, 24));
  leftRail.add(new RailSegment("C1", 1, 4, 24));
  leftRail.add(new RailSegment("C2", 1, 31, 24));
  leftRail.add(new RailSegment("C3", 1, 56, 25));
  leftRail.add(new RailSegment("C4", 1, 83, 23));
  leftRail.add(new RailSegment("C5", 1, 110, 23));
  leftRail.add(new RailSegment("C6", 1, 138, 23));  //fixme
  leftRail.add(new RailSegment("D1", 2, 4, 24));
  leftRail.add(new RailSegment("D2", 2, 29, 24));
  leftRail.add(new RailSegment("D3", 2, 54, 24));
  leftRail.add(new RailSegment("D4", 2, 81, 23));
  leftRail.add(new RailSegment("D5", 2, 107, 24));
  leftRail.add(new RailSegment("D6", 2, 132, 24));
  leftRail.add(new RailSegment("E1", 7, 3, 24));
  leftRail.add(new RailSegment("E2", 7, 29, 25));
  leftRail.add(new RailSegment("E3", 7, 55, 24));
  leftRail.add(new RailSegment("E4", 7, 80, 26));
  leftRail.add(new RailSegment("E5", 7, 107, 25));
  leftRail.add(new RailSegment("E6", 7, 135, 23));
  leftRail.add(new RailSegment("H1", 3, 3, 24));
  leftRail.add(new RailSegment("H2", 3, 29, 23));
  leftRail.add(new RailSegment("H3", 3, 53, 26));
  leftRail.add(new RailSegment("H4", 3, 80, 24));
  leftRail.add(new RailSegment("H5", 3, 107, 23));
  leftRail.add(new RailSegment("H6", 3, 132, 24));
}
