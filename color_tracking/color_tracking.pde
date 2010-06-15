// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-11: Simple color tracking

import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor1;
color trackColor2; 

void setup() {
  size(640,480);
  video = new Capture(this,width,height,15);
  // Start off tracking for red
//  trackColor = color(255,0,0);
  smooth();
}

void draw() {
  // Capture and display the video
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord1 = 500;
  float worldRecord2 = 500; 

  // XY coordinate of closest color
  int closestX1 = 0;
  int closestY1 = 0;
  int closestX2 = 0;
  int closestY2 = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor1);
      float g2 = green(trackColor1);
      float b2 = blue(trackColor1);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord1) {
        worldRecord1 = d;
        closestX1 = x;
        closestY1 = y;
      }
    }
  }
  
    for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor2);
      float g2 = green(trackColor2);
      float b2 = blue(trackColor2);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord2) {
        worldRecord2 = d;
        closestX2 = x;
        closestY2 = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  int range = 15;
  if ((worldRecord1 < range) && (worldRecord2 < range)) { 
    // Draw a circle at the tracked pixel
    strokeWeight(4.0);
    stroke(color(31, 43, 255));
    //ellipse(closestX,closestY,32,32);
    if ((trackColor1<0) && (trackColor2<0)){
      line(closestX1, closestY1, closestX2, closestY2);
    }
  }
}

void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  if (trackColor1>=0){
    trackColor1 = video.pixels[loc];
    println("Cor1 definida: " + trackColor1);
  } else if (trackColor2>=0){
    trackColor2 = video.pixels[loc];
    println("Cor2 definida: " + trackColor2);
  }
    
}

