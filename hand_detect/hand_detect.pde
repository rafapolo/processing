import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PGraphics drawing;
int oldX = 0;
int oldY = 0;

void setup() {
  size( 640, 480 );
  noFill();
  opencv = new OpenCV(this);
  opencv.capture( width, height);
  //opencv.cascade("/Users/rafaelpolo/Documents/haarcascade_frontalface_alt.xml");
  opencv.cascade("/Users/rafaelpolo/Documents/aGest.xml");  
  // opencv.cascade("/Users/rafaelpolo/Documents/haarcascade_hand2.xml");
}

void draw() {
  opencv.read();
  Rectangle[] faces = opencv.detect( 1.2, 3, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  image(opencv.image(), 0, 0 );

  int x = 0;
  int y = 0;

  for( int i=0; i<faces.length; i++ ) {
    rect(faces[0].x, faces[0].y, faces[0].width, faces[0].height );
    x = faces[0].x;
    y = faces[0].y;
  }
  
  if (faces.length>0){
    PImage tela = opencv.image();
    tela.resize(faces[0].width, faces[0].height);
    set(x, y, tela);
  }

}

public void stop() {
  opencv.stop();
  super.stop();
}

