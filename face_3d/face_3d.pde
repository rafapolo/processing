import saito.objloader.*;
import processing.opengl.*;
import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PGraphics drawing;

OBJModel model;
float rotX;
float rotY;
float centerX;
float centerY;
float rot = 0.5;
float pos;

void setup()
{ 
  size(640, 480, OPENGL);
  model = new OBJModel(this, "face.obj");
  opencv = new OpenCV(this);
  opencv.convert(GRAY);
  opencv.capture(width, height);
  opencv.cascade("/Users/rafaelpolo/Documents/haarcascade_frontalface_alt.xml");
}

void draw()
{
  background(0);
  noStroke();
  lights();   
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(rotY);
  rotateY(rotX);
  scale(80.0);
  model.drawMode(POLYGON);
  model.draw();
  popMatrix();

  opencv.read();
  noFill();
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
 // show webcam
  image(opencv.image(), 0, 0);
  if (faces.length>0){
    Rectangle face = faces[0];
    rect(face.x, face.y, face.width, face.height);
    centerX = face.x + face.width/2;
    rotX = centerX > width/2 ? (centerX/2)*rot/(width/2) : (centerX*rot/(width/2))-rot;
    //rotX = pos - width/2;
    centerY = face.y + face.height/2;
   // rotY = centerY > height/2 ? ((centerY/2)*rot/(height/2)) : (centerY*-(rot-0.1)/(height/2));
  }
}


