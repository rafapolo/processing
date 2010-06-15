import hypermedia.video.*;
import java.awt.Rectangle;
import processing.video.*;

Movie myMovie;
PImage a;
OpenCV opencv;
PGraphics drawing;
int contrast = 0;

void setup() {
  size( 654, 404 );
  a = loadImage("a.jpg");
  noFill();
  opencv = new OpenCV(this);
  opencv.capture( width, height);
  opencv.cascade("/Users/rafaelpolo/Documents/aGest.xml");
  //myMovie = new Movie(this, "barba.mov");
 // myMovie.loop();
} 

void draw() {
  opencv.read();
  //image(opencv.image(), 0, 0 );
  Rectangle[] faces = opencv.detect( 1.2, 3, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  int x = 0;
  int y = 0;
  for( int i=0; i<faces.length; i++ ) {
    rect(faces[0].x, faces[0].y, faces[0].width, faces[0].height );
    y = (faces[0].y * 255) / 350;
  }
  if (y>0){
    contrast = y;
  }
  println(contrast);

  tint(contrast);
 // image(myMovie, 0, 0);
  image(a, 0, 0);
}

void movieEvent(Movie m) {
 // m.read();
}

