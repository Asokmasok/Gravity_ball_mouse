import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
OpenCV opencv;
Capture cam;
Rectangle[] faces;

Ball[] b = new Ball[5];

void setup() {
  size(640, 480);
  //b = new Ball();

  cam = new Capture(this, width, height);
  cam.start();
  opencv = new OpenCV(this, cam.width, cam.height); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 

  for (int i = 0; i < b.length; i++) {

    b[i] = new Ball();
  }
}

void draw() {
  background(255);
  opencv.loadImage(cam);  // We have to always "load" the camera image into OpenCV 
  faces = opencv.detect();   // Detect the faces




  for (int i = 0; i< b.length; i++) {
    b[i].display();
    for (int f=0; f<faces.length; f++ ) {
      b[i].update(faces[f].x, faces[f].y);
    }
  }
}

void captureEvent(Capture cam) { // New images from camera
  cam.read();
}
