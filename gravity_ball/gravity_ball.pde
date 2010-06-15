import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PImage bola = loadImage("/Users/rafaelpolo/Documents/Processing/move_image/bola.png");

float x = 0;
float y = 0;
float speed = 2;
float gravity = 3.0;

void setup() {
  size( 640, 480 );
  opencv = new OpenCV(this);
  opencv.capture( width, height);
  opencv.cascade("/Users/rafaelpolo/Documents/aGest.xml"); 
  smooth();
}

void draw() {
  opencv.read();
  Rectangle[] hands = opencv.detect( 1.2, 4, OpenCV.HAAR_DO_CANNY_PRUNING, 20, 20 );
  image(opencv.image(), 0, 0);

  fill(175);
  stroke(0);
  if ((hands.length>0) && (hands[0].x>0)){
    x = hands[0].x;
    y = hands[0].y;
  }

  if (x>0){
    image(bola, x, y);
    y = y + speed;
    speed = speed + gravity;
    if (y > height-bola.height) {
      speed = speed * -0.80;  
    }
  }

}





