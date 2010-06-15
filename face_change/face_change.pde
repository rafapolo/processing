import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PGraphics drawing;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;

void setup() {
    size( 640, 480 );
    opencv = new OpenCV(this);
    opencv.capture( width, height);
    opencv.cascade("haarcascade_frontalface_alt.xml");
    //opencv.cascade("/Users/rafaelpolo/Documents/aGest.xml");   
  smooth();
}

public void stop() {
    opencv.stop();
    super.stop();
}

void draw() {
    opencv.read();
//    opencv.contrast(contrast_value);
//    opencv.brightness(brightness_value);

    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_SCALE_IMAGE, 40, 40 );

    image(opencv.image(), 0, 0 );
    noFill();
    for( int i=0; i<faces.length; i++ ) {
     if (faces.length>1){
       PImage face1 = opencv.image().get(faces[0].x, faces[0].y, faces[0].width, faces[0].height );
       PImage face2 = opencv.image().get(faces[1].x, faces[1].y, faces[1].width, faces[1].height );
       // 1 > 2
       face1.resize(faces[1].height, faces[1].width);
       image(face1, faces[1].x, faces[1].y);
       // 2 > 1
       face2.resize(faces[0].height, faces[0].width);
       image(face2, faces[0].x, faces[0].y);
     }
    }
}

