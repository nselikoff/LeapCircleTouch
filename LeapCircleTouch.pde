// LeapCircleTouch.pde - Nathan Selikoff, Oct 2013
// http://nathanselikoff.com/training
// http://awakeningstudios.com

// Simple dexterity test example for Leap Motion Controller
// Point to the screen and "touch" the circle as quickly as possible
// The number of seconds it took you will be printed to the console
// Relevant forum post: https://developer.leapmotion.com/forums/forums/general-discussion/topics/new-developer-looking-for-good-starting-help
// Uses Leap Motion for Processing library: https://github.com/voidplus/leap-motion-processing

import de.voidplus.leapmotion.*;

LeapMotion leap;
PVector fingerPosition;
int initTime = millis();

Circle aCircle;

void setup() {
  
  size(400, 300);
  
  // start the Leap Motion
  leap = new LeapMotion(this);
  
  fingerPosition = new PVector(0, 0);
  
  aCircle = new Circle();
}

void draw() {
  background(0);
  
  // draw the circle
  aCircle.draw();
  
  // draw the finger position
  ellipse(fingerPosition.x, fingerPosition.y, 5, 5);
  
  if (aCircle.isHit(fingerPosition)) {
    // randomize the position of the circle
    aCircle.move();
    
    // output time in seconds from last hit
    println((millis() - initTime) * 0.001);
    
    // reset the timer
    initTime = millis();
  }
}

// listen for new Leap Motion frames of data
void leapOnFrame() {
  Hand hand = leap.getFrontHand();
  Finger finger = hand.getFrontFinger();
  fingerPosition.set(finger.getPosition().x, finger.getPosition().y);
}

