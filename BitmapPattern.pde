class BitmapPattern extends Pattern {
  
  Fixture fixture;
  
  BitmapPattern(Fixture fix) {
    super();
    fixture = fix;
  }
  
  
  void draw() {
    fixture.project();    
  }
}

