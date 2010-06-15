import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PImage coelho;

int x = 0;
int y = 0;
int lastx, lasty;

void setup() {
  size( 640, 480 );
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade("aGest.xml");
  coelho = loadImage("coelho.png");
}

void draw() {
  opencv.read();
  Rectangle[] hands = opencv.detect( 1.2, 4, OpenCV.HAAR_DO_CANNY_PRUNING, 20, 20 );
  image(opencv.image(), 0, 0 );

  if (hands.length>0){
    Rectangle hand = hands[0];    
    x = hand.x;
    y = hand.y;
    lastx = x;
    lasty = y;
    //coelho.resize(0, hand.height);
    //println("["+x+","+y+"]");
    image(coelho, x, y+10);
  } else if(lastx>0){   
    image(coelho, lastx, lasty+10);
  }

}

public void stop() {
  opencv.stop();
  super.stop();
}



