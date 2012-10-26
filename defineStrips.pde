//// Share this between the transmitter and simulator.

//void defineLeftTrapazoid() {
//	LeftTrapazoidSegments = new LinkedList<Segment>();
//        LeftTrapazoidSegments.add(new Segment(0, BOX4 + 3, 154, -44));    // Num, Strip, Start LED, Length (negative means backwards)
//        LeftTrapazoidSegments.add(new Segment(1, BOX4 + 3, 59, 46));
//        LeftTrapazoidSegments.add(new Segment(2, BOX4 + 3, 54, -50));
//        LeftTrapazoidSegments.add(new Segment(3, BOX4 + 2, 159, -50));
//        LeftTrapazoidSegments.add(new Segment(4, BOX4 + 2, 51, 52));
//        LeftTrapazoidSegments.add(new Segment(5, BOX4 + 1, 157, 2, BOX4 + 2, 0, 50));
//        LeftTrapazoidSegments.add(new Segment(6, BOX4 + 1, 153, -55));
//        LeftTrapazoidSegments.add(new Segment(7, BOX4 + 1, 39, 57));
//        LeftTrapazoidSegments.add(new Segment(8, BOX4 + 1, 34, -34, BOX4 + 0, 159, -23));
//        LeftTrapazoidSegments.add(new Segment(9, BOX4 + 0, 71, 62));
//        LeftTrapazoidSegments.add(new Segment(10, BOX4 + 0, 64, -64));
//}
//
//void defineCenterTrapazoid() {
//        CenterTrapazoidSegments = new LinkedList<Segment>();
//        CenterTrapazoidSegments.add(new Segment(0, BOX4 + 3, 154, -44));    // Num, Strip, Start LED, Length (negative means backwards)
//        CenterTrapazoidSegments.add(new Segment(1, BOX4 + 3, 59, 46));
//        CenterTrapazoidSegments.add(new Segment(2, BOX4 + 3, 54, -50));
//        CenterTrapazoidSegments.add(new Segment(3, BOX4 + 2, 159, -50));
//        CenterTrapazoidSegments.add(new Segment(4, BOX4 + 2, 51, 52));
//        CenterTrapazoidSegments.add(new Segment(5, BOX4 + 1, 157, 2, BOX4 + 2, 0, 50));
//        CenterTrapazoidSegments.add(new Segment(6, BOX4 + 1, 153, -55));
//        CenterTrapazoidSegments.add(new Segment(7, BOX4 + 1, 39, 57));
//        CenterTrapazoidSegments.add(new Segment(8, BOX4 + 1, 34, -34, BOX4 + 0, 159, -23));
//        CenterTrapazoidSegments.add(new Segment(9, BOX4 + 0, 71, 62));
//        CenterTrapazoidSegments.add(new Segment(10, BOX4 + 0, 64, -64));
//}
//
//void defineRightTrapazoid() {
//        RightTrapazoidSegments = new LinkedList<Segment>();
//        RightTrapazoidSegments.add(new Segment(0, BOX4 + 3, 154, -44));    // Num, Strip, Start LED, Length (negative means backwards)
//        RightTrapazoidSegments.add(new Segment(1, BOX4 + 3, 59, 46));
//        RightTrapazoidSegments.add(new Segment(2, BOX4 + 3, 54, -50));
//        RightTrapazoidSegments.add(new Segment(3, BOX4 + 2, 159, -50));
//        RightTrapazoidSegments.add(new Segment(4, BOX4 + 2, 51, 52));
//        RightTrapazoidSegments.add(new Segment(5, BOX4 + 1, 157, 2, BOX4 + 2, 0, 50));
//        RightTrapazoidSegments.add(new Segment(6, BOX4 + 1, 153, -55));
//        RightTrapazoidSegments.add(new Segment(7, BOX4 + 1, 39, 57));
//        RightTrapazoidSegments.add(new Segment(8, BOX4 + 1, 34, -34, BOX4 + 0, 159, -23));
//        RightTrapazoidSegments.add(new Segment(9, BOX4 + 0, 71, 62));
//        RightTrapazoidSegments.add(new Segment(10, BOX4 + 0, 64, -64));
//}


void defineLeftRail() {
   LeftRailSegments = new LinkedList<Segment>();		     // Name, [ Physical Space    ]  [     2D space     ]
  LeftRailSegments.add(new Segment("A2", BOX1 + 0, 29, 24, 4, 3));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("A3", BOX1 + 0, 55, 24, 3, 2));
  LeftRailSegments.add(new Segment("A4", BOX1 + 0, 81, 25, 2, 1)); 
  LeftRailSegments.add(new Segment("A5", BOX1 + 0, 107, 25, 1, 0)); 
  LeftRailSegments.add(new Segment("A6", BOX1 + 0, 133, 24, 0, 10));

  LeftRailSegments.add(new Segment("B1", BOX1 + 6, 8, 24, 4, 13));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("B2", BOX1 + 6, 26, 23, 13, 21));
  LeftRailSegments.add(new Segment("B3", BOX1 + 6, 52, 24, 21, 12)); 
  LeftRailSegments.add(new Segment("B4", BOX1 + 6, 78, 24, 12, 2)); 
  LeftRailSegments.add(new Segment("B5", BOX1 + 6, 104, 24, 2, 11));
  LeftRailSegments.add(new Segment("B6", BOX1 + 6, 130, 24, 11, 19)); 

  LeftRailSegments.add(new Segment("C1", BOX1 + 1, 4, 24, 14, 13));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("C2", BOX1 + 1, 31, 24, 13, 12));
  LeftRailSegments.add(new Segment("C3", BOX1 + 1, 56, 25, 12, 11)); 
  LeftRailSegments.add(new Segment("C4", BOX1 + 1, 83, 23, 11, 10)); 
  LeftRailSegments.add(new Segment("C5", BOX1 + 1, 110, 23, 10, 1));
  LeftRailSegments.add(new Segment("C6", BOX1 + 1, 138, 21, 1, 11)); 

  LeftRailSegments.add(new Segment("D1", BOX1 + 2, 4, 24, 14, 22));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("D2", BOX1 + 2, 29, 24, 22, 13));
  LeftRailSegments.add(new Segment("D3", BOX1 + 2, 54, 24, 13, 3)); 
  LeftRailSegments.add(new Segment("D4", BOX1 + 2, 81, 23, 3, 12)); 
  LeftRailSegments.add(new Segment("D5", BOX1 + 2, 107, 23, 12, 20));
  LeftRailSegments.add(new Segment("D6", BOX1 + 2, 132, 24, 20, 11)); 

  LeftRailSegments.add(new Segment("E1", BOX1 + 7, 3, 24, 14, 23));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("E2", BOX1 + 7, 29, 25, 23, 22));
  LeftRailSegments.add(new Segment("E3", BOX1 + 7, 55, 24, 22, 21)); 
  LeftRailSegments.add(new Segment("E4", BOX1 + 7, 80, 26, 21, 20)); 
  LeftRailSegments.add(new Segment("E5", BOX1 + 7, 107, 25, 20, 19));
  LeftRailSegments.add(new Segment("E6", BOX1 + 7, 132, 23, 19, 10)); 

  LeftRailSegments.add(new Segment("F1", BOX1 + 5, 3, 24, 14, 15));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("F2", BOX1 + 5, 29, 23, 15, 6));
  LeftRailSegments.add(new Segment("F3", BOX1 + 5, 53, 26, 6, 16));    // F is not mapped in physical space !!
  LeftRailSegments.add(new Segment("F4", BOX1 + 5, 80, 24, 16, 25)); 
  LeftRailSegments.add(new Segment("F5", BOX1 + 5, 107, 23, 25, 24));
  LeftRailSegments.add(new Segment("F6", BOX1 + 5, 132, 24, 24, 16)); 

  LeftRailSegments.add(new Segment("G1", BOX1 + 4, 3, 24, 14, 5));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("G2", BOX1 + 4, 29, 23, 5, 15));
  LeftRailSegments.add(new Segment("G3", BOX1 + 4, 53, 26, 15, 24));     // G is not mapped in physical space !!
  LeftRailSegments.add(new Segment("G4", BOX1 + 4, 80, 24, 24, 23)); 
  LeftRailSegments.add(new Segment("G5", BOX1 + 4, 107, 23, 23, 15));
  LeftRailSegments.add(new Segment("G6", BOX1 + 4, 132, 24, 15, 16)); 

  LeftRailSegments.add(new Segment("H1", BOX1 + 3, 3, 24, 14, 4));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("H2", BOX1 + 3, 29, 23, 4, 5));
  LeftRailSegments.add(new Segment("H3", BOX1 + 3, 53, 26, 5, 6)); 
  LeftRailSegments.add(new Segment("H4", BOX1 + 3, 80, 24, 6, 7)); 
  LeftRailSegments.add(new Segment("H5", BOX1 + 3, 107, 23, 7, 16));
  LeftRailSegments.add(new Segment("H6", BOX1 + 3, 132, 24, 16, 17)); 

  LeftRailSegments.add(new Segment("J1", BOX1 + 3, 3, 24, 18, 8));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("J2", BOX1 + 3, 29, 23, 8, 9));
  LeftRailSegments.add(new Segment("J3", BOX1 + 3, 53, 26, 9, 18));    // J is not mapped in physical space !!
  LeftRailSegments.add(new Segment("J4", BOX1 + 3, 80, 24, 18, 26)); 
  LeftRailSegments.add(new Segment("J5", BOX1 + 3, 107, 23, 26, 25));
  LeftRailSegments.add(new Segment("J6", BOX1 + 3, 132, 24, 25, 17)); 

  LeftRailSegments.add(new Segment("K1", BOX1 + 8, 3, 24, 18, 17));   // Name, Strip, Offset, Length, StartPoint, EndPoint
  LeftRailSegments.add(new Segment("K2", BOX1 + 8, 29, 23, 17, 8));
  LeftRailSegments.add(new Segment("K3", BOX1 + 8, 53, 26, 8, 7));    // K is not mapped in physical space !!
  LeftRailSegments.add(new Segment("K4", BOX1 + 8, 80, 24, 7, 17)); 
  LeftRailSegments.add(new Segment("K5", BOX1 + 8, 107, 23, 17, 26));
}
//
//void defineRightRail() {
//  RightRailSegments = new LinkedList<Segment>();		     // Name, [ Physical Space    ]  [     2D space     ]
//  RightRailSegments.add(new Segment("A2", BOX1 + 0, 29, 24, 4, 3));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("A3", BOX1 + 0, 55, 24, 3, 2));
//  RightRailSegments.add(new Segment("A4", BOX1 + 0, 81, 25, 2, 1)); 
//  RightRailSegments.add(new Segment("A5", BOX1 + 0, 107, 25, 1, 0)); 
//  RightRailSegments.add(new Segment("A6", BOX1 + 0, 133, 24, 0, 10));
//
//  RightRailSegments.add(new Segment("B1", BOX1 + 6, 8, 24, 4, 13));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("B2", BOX1 + 6, 26, 23, 13, 21));
//  RightRailSegments.add(new Segment("B3", BOX1 + 6, 52, 24, 21, 12)); 
//  RightRailSegments.add(new Segment("B4", BOX1 + 6, 78, 24, 12, 2)); 
//  RightRailSegments.add(new Segment("B5", BOX1 + 6, 104, 24, 2, 11));
//  RightRailSegments.add(new Segment("B6", BOX1 + 6, 130, 24, 11, 19)); 
//
//  RightRailSegments.add(new Segment("C1", BOX1 + 1, 4, 24, 14, 13));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("C2", BOX1 + 1, 31, 24, 13, 12));
//  RightRailSegments.add(new Segment("C3", BOX1 + 1, 56, 25, 12, 11)); 
//  RightRailSegments.add(new Segment("C4", BOX1 + 1, 83, 23, 11, 10)); 
//  RightRailSegments.add(new Segment("C5", BOX1 + 1, 110, 23, 10, 1));
//  RightRailSegments.add(new Segment("C6", BOX1 + 1, 138, 23, 1, 11)); 
//
//  RightRailSegments.add(new Segment("D1", BOX1 + 2, 4, 24, 14, 22));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("D2", BOX1 + 2, 29, 24, 22, 13));
//  RightRailSegments.add(new Segment("D3", BOX1 + 2, 54, 24, 13, 3)); 
//  RightRailSegments.add(new Segment("D4", BOX1 + 2, 81, 23, 3, 12)); 
//  RightRailSegments.add(new Segment("D5", BOX1 + 2, 107, 24, 12, 20));
//  RightRailSegments.add(new Segment("D6", BOX1 + 2, 132, 24, 20, 11)); 
//
//  RightRailSegments.add(new Segment("E1", BOX1 + 7, 3, 24, 14, 23));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("E2", BOX1 + 7, 29, 25, 23, 22));
//  RightRailSegments.add(new Segment("E3", BOX1 + 7, 55, 24, 22, 21)); 
//  RightRailSegments.add(new Segment("E4", BOX1 + 7, 80, 26, 21, 20)); 
//  RightRailSegments.add(new Segment("E5", BOX1 + 7, 107, 25, 20, 19));
//  RightRailSegments.add(new Segment("E6", BOX1 + 7, 132, 23, 19, 10)); 
//
//  RightRailSegments.add(new Segment("F1", BOX1 + 3, 3, 24, 14, 15));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("F2", BOX1 + 3, 29, 23, 15, 6));
//  RightRailSegments.add(new Segment("F3", BOX1 + 3, 53, 26, 6, 16));    // F is not mapped in physical space !!
//  RightRailSegments.add(new Segment("F4", BOX1 + 3, 80, 24, 16, 25)); 
//  RightRailSegments.add(new Segment("F5", BOX1 + 3, 107, 23, 25, 24));
//  RightRailSegments.add(new Segment("F6", BOX1 + 3, 132, 24, 24, 16)); 
//
//  RightRailSegments.add(new Segment("G1", BOX1 + 3, 3, 24, 14, 5));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("G2", BOX1 + 3, 29, 23, 5, 15));
//  RightRailSegments.add(new Segment("G3", BOX1 + 3, 53, 26, 15, 24));     // G is not mapped in physical space !!
//  RightRailSegments.add(new Segment("G4", BOX1 + 3, 80, 24, 24, 23)); 
//  RightRailSegments.add(new Segment("G5", BOX1 + 3, 107, 23, 23, 15));
//  RightRailSegments.add(new Segment("G6", BOX1 + 3, 132, 24, 15, 16)); 
//
//  RightRailSegments.add(new Segment("H1", BOX1 + 3, 3, 24, 14, 4));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("H2", BOX1 + 3, 29, 23, 4, 5));
//  RightRailSegments.add(new Segment("H3", BOX1 + 3, 53, 26, 5, 6)); 
//  RightRailSegments.add(new Segment("H4", BOX1 + 3, 80, 24, 6, 7)); 
//  RightRailSegments.add(new Segment("H5", BOX1 + 3, 107, 23, 7, 16));
//  RightRailSegments.add(new Segment("H6", BOX1 + 3, 132, 24, 16, 17)); 
//
//  RightRailSegments.add(new Segment("J1", BOX1 + 3, 3, 24, 18, 8));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("J2", BOX1 + 3, 29, 23, 8, 9));
//  RightRailSegments.add(new Segment("J3", BOX1 + 3, 53, 26, 9, 18));    // J is not mapped in physical space !!
//  RightRailSegments.add(new Segment("J4", BOX1 + 3, 80, 24, 18, 26)); 
//  RightRailSegments.add(new Segment("J5", BOX1 + 3, 107, 23, 26, 25));
//  RightRailSegments.add(new Segment("J6", BOX1 + 3, 132, 24, 25, 17)); 
//
//  RightRailSegments.add(new Segment("K1", BOX1 + 3, 3, 24, 18, 17));   // Name, Strip, Offset, Length, StartPoint, EndPoint
//  RightRailSegments.add(new Segment("K2", BOX1 + 3, 29, 23, 17, 8));
//  RightRailSegments.add(new Segment("K3", BOX1 + 3, 53, 26, 8, 7));    // K is not mapped in physical space !!
//  RightRailSegments.add(new Segment("K4", BOX1 + 3, 80, 24, 7, 17)); 
//  RightRailSegments.add(new Segment("K5", BOX1 + 3, 107, 23, 17, 26));
//}

