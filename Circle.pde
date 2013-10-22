class Circle {
 
  PVector mCenter;
  int mRadius;
  int mBuffer;
  
  Circle()
  {
    // initialize the center position vector
    mCenter = new PVector(0,0);
    
    mRadius = 10;
    
    // how far from the screen edge in pixels to avoid placing the circle
    mBuffer = 35;

    // randomize the start position    
    move();
  }
  
  boolean isHit(PVector aPoint)
  {
    return mCenter.dist(aPoint) <= mRadius;
  }
  
  void move()
  {
    // randomize the position
    mCenter.set(random(width - mBuffer*2) + mBuffer, random(height - mBuffer*2) + mBuffer);
  }
  
  void draw() {
    ellipse(mCenter.x, mCenter.y, mRadius, mRadius); 
  }
}
