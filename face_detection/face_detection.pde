import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PGraphics drawing;

void setup() {
    size( 640, 480 );
    opencv = new OpenCV(this);
    opencv.capture( width, height);
    opencv.cascade("haarcascade_frontalface_alt.xml");
}

void draw() {
    opencv.read();
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
    image(opencv.image(), 0, 0 );
    
    for( int i=0; i<faces.length; i++ ) {
      noFill();
     // rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);   
      image(loadImage("moustache.png"), faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
}


