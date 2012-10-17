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
}

void draw() {
  // Add any new patterns that might have arrived
  while(noteOnMessages.size() > 0) {
    MidiMessage m = noteOnMessages.poll();
    switch(m.m_channel) {
      case 0:
        activePatterns.add(new LinePattern(m.m_channel, m.m_pitch, m.m_velocity));
        break;
    }
    switch(m.m_channel) {
      case 1:
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
        println(p.m_channel);
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

