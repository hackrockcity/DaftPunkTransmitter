import themidibus.*;

import processing.opengl.*;
import java.lang.reflect.Method;
import hypermedia.net.*;
import java.io.*;
import java.util.concurrent.*;

/////////// Configuration Options /////////////////////

boolean duplicateTrapazoids = true;
boolean duplicateRails = false;
boolean mirrorRails = false;

// Network configuration
//String transmit_address = "192.168.0.16";  // Default 127.0.0.1
String transmit_address = "127.0.0.1";  // Default 127.0.0.1
int transmit_port       = 58082;        // Default 58802

// Display configuration
int displayWidth = 40;                  // 8* number of control boxes
int displayHeight = 160;                // 160 for full-height strips

int FRAMERATE = 30;                     // larger number means faster updates
float bright = 1;                       // Global brightness modifier
String midiInputName = "IAC Bus 1";
//String midiInputName = "Port 1";

long modeFrameStart;


//Pattern[] enabledRoutines = new Pattern[] {
//  new Bursts(), 
//  new RGBRoutine(), 
//  new ColorDrop(), 
//  new WarpSpeedMrSulu()
//
//    //new RainbowColors(), // Doesn't work at this scale
//  };

HashMap<String, Pattern> enabledPatterns;

boolean leftProject = true;
BitmapPattern leftRailBitmap;

boolean rightProject = true;
BitmapPattern rightRailBitmap;

List<Segment> LeftRailSegments;
Fixture leftRail;

List<Segment> RightRailSegments;
Fixture rightRail;

Fixture combinedRails;
BitmapPattern combinedBitmap;

Fixture combinedTrapazoids;
BitmapPattern combinedTrapBitmap;

List<Segment> LeftTrapazoidSegments;
Fixture leftTrapazoid;

List<Segment> CenterTrapazoidSegments;
Fixture centerTrapazoid;

List<Segment> RightTrapazoidSegments;
Fixture rightTrapazoid;

int BOX0=0;
int BOX1=8;
int BOX2=16;
int BOX3=24;
int BOX4=32;

int strips = 40;

int rectX = 100;
int rectY = 100;


public color[] channelColors = new color[] {
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


///////////////////////////////////////////////////////

class MidiMessage {
  public int m_channel;
  public int m_pitch;
  public int m_velocity;

  MidiMessage(int channel, int pitch, int velocity) {
    m_channel = channel;
    m_pitch = pitch;
    m_velocity = velocity;
  }
}

List<Pattern> activePatterns;  // Patterns that are currently displaying
List<Pattern> priorityPatterns;  // Patterns that are currently displaying
LinkedBlockingQueue<MidiMessage> noteOnMessages;    // 'On' messages that we need to handle
LinkedBlockingQueue<MidiMessage> noteOffMessages;   // 'Off' messages that we need to handle

LEDDisplay    sign;
MidiBus       myBus;


void setup() {
  size(1400, 350);
  frameRate(FRAMERATE);

  enabledPatterns = new HashMap<String, Pattern>();

  Bursts bursts = new Bursts();
  bursts.m_channel = 9;
  bursts.m_pitch = 24;
  enabledPatterns.put("Bursts", bursts);
  
  RGBRoutine rgb = new RGBRoutine();
  rgb.m_channel = 9;
  rgb.m_pitch = 26;
  enabledPatterns.put("RGB", rgb);

  for (Map.Entry r : enabledPatterns.entrySet()) {
    Pattern pat = (Pattern) r.getValue();
    pat.setup(this);
    pat.reset();
  }  

  activePatterns = Collections.synchronizedList(new LinkedList<Pattern>());
  priorityPatterns = Collections.synchronizedList(new LinkedList<Pattern>());

  noteOnMessages = new LinkedBlockingQueue<MidiMessage>();
  noteOffMessages = new LinkedBlockingQueue<MidiMessage>();

  sign = new LEDDisplay(this, displayWidth, displayHeight, true, transmit_address, transmit_port);
  sign.setAddressingMode(LEDDisplay.ADDRESSING_HORIZONTAL_NORMAL);  
  sign.setEnableGammaCorrection(true);

  myBus = new MidiBus(this, midiInputName, -1);  

  defineLeftRail();   // Define the rail segments by where they are in pixel space
  //leftRail = new Fixture(LeftRailSegments, new PVector(100, 0));


   defineRightRail();
   //rightRail = new Fixture(RightRailSegments, new PVector(750, 0));
   combinedRails = new Fixture(LeftRailSegments, RightRailSegments, new PVector(100, 000));
  

  defineLeftTrapazoid();
  defineCenterTrapazoid();
  defineRightTrapazoid();

  combinedTrapazoids = new Fixture(LeftTrapazoidSegments, CenterTrapazoidSegments, RightTrapazoidSegments, new PVector(250, 200));


  combinedBitmap = new BitmapPattern(combinedRails);
  combinedTrapBitmap = new BitmapPattern(combinedTrapazoids);

  modeFrameStart = frameCount;
}

void draw() {
  int segment;
  
    background(0);


//  if (leftProject && !activePatterns.contains(leftRailBitmap)) activePatterns.add(leftRailBitmap);
//  if (rightProject && !activePatterns.contains(rightRailBitmap)) activePatterns.add(rightRailBitmap);

  // Add any new patterns that might have arrived
  while (noteOnMessages.size () > 0) {
    MidiMessage m = noteOnMessages.poll();
    println("on " + m.m_channel + " " + m.m_pitch);
    switch(m.m_channel) {
      
    case 1:
      // Strips
      //        println("Adding line pattern " + m.m_channel + " " + m.m_pitch + " " + m.m_velocity);
      priorityPatterns.add(new LinePattern(m.m_channel, m.m_pitch, m.m_velocity));
      break;
    case 0:
      // Segments
      //        println("Adding rail segment pattern " + m.m_channel + " " + m.m_pitch + " " + m.m_velocity);

      segment = m.m_pitch - 36;

      if (segment >= 0 && segment < LeftRailSegments.size()) {
        priorityPatterns.add(new RailSegmentPattern(LeftRailSegments.get(segment), m.m_channel, m.m_pitch, m.m_velocity));
        priorityPatterns.add(new RailSegmentPattern(RightRailSegments.get(segment), m.m_channel, m.m_pitch, m.m_velocity));

      }
      break;
    case 2:
      //        println("Adding flashes " + m.m_channel + " " + m.m_pitch + " " + m.m_velocity);

      // Flashes
      activePatterns.add(new FlashPattern(m.m_channel, m.m_pitch, m.m_velocity));
      break;

    case 9:
      
      for (Map.Entry p : enabledPatterns.entrySet()) {
        Pattern pat = (Pattern) p.getValue();
        if (pat.m_channel == m.m_channel && pat.m_pitch == m.m_pitch && !activePatterns.contains(pat)) {
          activePatterns.add(pat);
        }
      }
      break;

      // What ever isn't mapped uses the brightness pattern
    default:
      priorityPatterns.add(
      new RailSegmentBrightnessPattern(
      m.m_channel, m.m_pitch, m.m_velocity
        )
        );

      break;
    }
  }
  

 

  //if (!leftProject) activePatterns.remove(leftRailBitmap);

  while (noteOffMessages.size () > 0) {
    MidiMessage m = noteOffMessages.poll();
    Iterator<Pattern> it = activePatterns.iterator();
    
    println("off " + m.m_channel + " " + m.m_pitch);
    while (it.hasNext ()) {
      Pattern p = it.next();
      if (p.m_channel == m.m_channel && p.m_pitch == m.m_pitch) {
        it.remove();
        println("removing " + it);
      }
    }
    
    Iterator<Pattern> it2 = priorityPatterns.iterator();
    println("off " + m.m_channel + " " + m.m_pitch);
    while (it2.hasNext ()) {
      Pattern p = it2.next();
      if (p.m_channel == m.m_channel && p.m_pitch == m.m_pitch) {
        it2.remove();
        println("removing " + it2);
      }
    }
  }

  // TODO: Remove any old patterns that might have disappeared

  pushStyle();
  fill(255);
  noStroke();
  rect(rectX - 50, rectY - 50, 100, 100);
  strokeWeight(1);
  stroke(255);
  line(displayWidth + 1, 0, displayWidth + 1, height);
  popStyle();



  for (Pattern p : activePatterns) {
    p.draw();
  }
  
  combinedBitmap.draw();
  combinedTrapBitmap.draw();
   
  for (Pattern p : priorityPatterns) {
    println(p);
    p.draw(); 
  }

  // delete dead patterns?
  if (keyPressed && key == 'c') {
    // clear everything
    activePatterns.clear();
    priorityPatterns.clear();
  }



  sign.sendData();
}


void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  // println("On  " + channel + " " + pitch + " " + velocity);

  noteOnMessages.add(new MidiMessage(channel, pitch, velocity));
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  //println("Off " + channel + " " + pitch + " " + velocity);

  noteOffMessages.add(new MidiMessage(channel, pitch, velocity));
}

void mouseMoved() {
  rectX = mouseX;
  rectY = mouseY;
}

