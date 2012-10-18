import themidibus.*;

import processing.opengl.*;
import java.lang.reflect.Method;
import hypermedia.net.*;
import java.io.*;
import java.util.concurrent.*;

/////////// Configuration Options /////////////////////

// Network configuration
String transmit_address = "127.0.0.1";  // Default 127.0.0.1
int transmit_port       = 58082;        // Default 58802

// Display configuration
int displayWidth = 40;                  // 8* number of control boxes
int displayHeight = 160;                // 160 for full-height strips

int FRAMERATE = 30;                     // larger number means faster updates

float bright = 1;                       // Global brightness modifier

String midiInputName = "IAC Bus 1";


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

List<RailSegment> leftRail;    // Rail segment mapping

List<Pattern> activePatterns;  // Patterns that are currently displaying
LinkedBlockingQueue<MidiMessage> noteOnMessages;    // 'On' messages that we need to handle
LinkedBlockingQueue<MidiMessage> noteOffMessages;   // 'Off' messages that we need to handle


LEDDisplay    sign;
MidiBus       myBus;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(FRAMERATE);

  activePatterns = Collections.synchronizedList(new LinkedList<Pattern>());

  noteOnMessages = new LinkedBlockingQueue<MidiMessage>();
  noteOffMessages = new LinkedBlockingQueue<MidiMessage>();

  sign = new LEDDisplay(this, displayWidth, displayHeight, true, transmit_address, transmit_port);
  sign.setAddressingMode(LEDDisplay.ADDRESSING_HORIZONTAL_NORMAL);  
  sign.setEnableGammaCorrection(true);

  myBus = new MidiBus(this, midiInputName, -1);  
  
  // Add the left rails
  leftRail = Collections.synchronizedList(new LinkedList<RailSegment>());
  leftRail.add(new RailSegment("A2", 0, 29, 24));
  leftRail.add(new RailSegment("A3", 0, 55, 24));
  leftRail.add(new RailSegment("A4", 0, 81, 25));
  leftRail.add(new RailSegment("A5", 0, 107, 25));
  leftRail.add(new RailSegment("A6", 0, 132, 25));
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

void draw() {
  // Add any new patterns that might have arrived
  while(noteOnMessages.size() > 0) {
    MidiMessage m = noteOnMessages.poll();
    switch(m.m_channel) {
      case 1:
        // Strips
        activePatterns.add(new LinePattern(m.m_channel, m.m_pitch, m.m_velocity));
        break;
      case 0:
        // Segments
        int segment = m.m_pitch - 60;

        if (segment >= 0 && segment < leftRail.size()) {
          println(segment);
          activePatterns.add(new RailSegmentPattern(leftRail.get(segment),m.m_channel, m.m_pitch, m.m_velocity));
        }
        break;
      case 2:
        // Flashes
        activePatterns.add(new FlashPattern(m.m_channel, m.m_pitch, m.m_velocity));
        break;
    }
  }
   
  while(noteOffMessages.size() > 0) {
    MidiMessage m = noteOffMessages.poll();
    Iterator<Pattern> it = activePatterns.iterator();
    while (it.hasNext()) {
      Pattern p = it.next();
      if(p.m_channel == m.m_channel && p.m_pitch == m.m_pitch) {
        it.remove();
      }
    }
  }
    
  // TODO: Remove any old patterns that might have disappeared
  
  background(0);

  for (Pattern p : activePatterns) {
    p.draw();
  }

  // delete dead patterns?
  if(keyPressed && key == 'c') {
    // clear everything
    activePatterns.clear();
  }
    

  sign.sendData();
}


void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
//  println("On  " + channel + " " + pitch + " " + velocity);

  noteOnMessages.add(new MidiMessage(channel, pitch, velocity));
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
//  println("Off " + channel + " " + pitch + " " + velocity);
  
  noteOffMessages.add(new MidiMessage(channel, pitch, velocity));
}

