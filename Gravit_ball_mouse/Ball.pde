class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;




  Ball() {
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update(float faceX, float faceY) {

    PVector mouse = new PVector (faceX, faceY);
    float diameter=20;
    noStroke();
    fill(0, 0, 0);
    ellipse(faceX, faceY, diameter, diameter);
    mouse.sub(location);
    mouse.setMag(1);
    acceleration = mouse;

    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
  }

  void display() {
    float diameter = 20;
    fill(0, 255, 0);
    ellipse(location.x, location.y, diameter, diameter);
  }
}
