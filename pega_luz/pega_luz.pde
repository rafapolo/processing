/**
Modification of Golan Levin's Brightness Tracking
*/
int oldX = 0;
int oldY = 0;

import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  background(0);
  video = new Capture(this, width, height, 30);
  noStroke();
  smooth();
}

void draw() {
  if (video.available()) {
    video.read();
    int brightestX = 0;
    int brightestY = 0;
    float brightestValue = 0;
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
	for (int x = 0; x < video.width; x++) {
	  int pixelValue = video.pixels[index];
	  float pixelBrightness = brightness(pixelValue);
	  if (pixelBrightness > brightestValue) {
	    brightestValue = pixelBrightness;
	    brightestY = y;
	    brightestX = x;
	  }
	  index++;
	}
    }
    
    stroke(255, 255, 255);
    strokeWeight(5);
    line(oldX, oldY, brightestX, brightestY);
    oldX = brightestX;
    oldY = brightestY;
  }
} 

void mousePressed(){
  background(0);
}

