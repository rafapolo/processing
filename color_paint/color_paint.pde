import processing.opengl.*;
import processing.video.*;

// Variable for capture device
Capture video;
color trackColor;

void setup() {
  size(640,480, P3D);
  video = new Capture(this,width,height,15);
  //smooth();
}

void draw() {
  // Capture and display the video
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500;

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = dist(r1,g1,b1,r2,g2,b2);
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  if (worldRecord < 10) { 
    strokeWeight(4.0);
    fill(trackColor);
    if (trackColor<0){
      noStroke();
      lights();
      translate(closestX, closestY);
      sphere(10);
    }
  }
}

void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  if (trackColor>=0){
    trackColor = video.pixels[loc];
    println("Cor definida: " + trackColor);
  }

}


