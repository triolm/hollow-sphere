import grafica.*;
//import peasy.*;
import java.io.FileWriter;
TriangulatedParticle c;
//MassiveParticle c;
Person p;
int STEPLEN = 200;
int speed = 200;
float yrot;
float xrot;
double SCALE = .1e10;
int recur = 3;
boolean FILLTRIANGLE = false;
int fps;

ArrayList<Boolean> inSphere = new ArrayList<Boolean>();

Vector3D lastFrameVel;
GPointsArray vels;
GPointsArray accels;
int frame = 0;
GPlot velPlot;
GPlot accelPlot;
long time;
ArrayList<Integer> colors = new ArrayList<Integer>();

//PeasyCam cam;
void setup() {
  SCALE = .1e10;
  recur = 3;

  xrot= 0;
  yrot= 0;
  //cam = new PeasyCam(this, 100);
  size(1600/2, 900/2, P3D);
  c = new Icosahedron(new Point(0, 0, 0), 20e10, 5e30d);
  //c = new Tetrahedron(new Point(0, 0, 0), 20e10, 1.9e30d);
  p = new Person(new Point(0, 40e10, 0));
  //p.applyAccel(new Vector3D(0, -3000/STEPLEN, 0));
  background(10, 5, 20);

  lastFrameVel = new Vector3D(0, 0, 0);

  plotSetup();

  time = System.currentTimeMillis();
}

void draw() {

  if (handleKeyDown()) return;

  frame ++;

  for (int i = 0; i < speed; i ++) {
    p.applyAccel(c.gravAccelRecur(p, recur));
    p.step();
  }

  accels.add(new GPoint(frame, (float)(lastFrameVel.subtract(p.velocity).norm())));
  vels.add(new GPoint(frame, (float)lastFrameVel.norm()));
  
  colors.add(p.p.dist(c.centroid()) < c.r ? color(0,0,255) : color(255,0,0));
  //colors.add(255);

  int[] colorsArr = colors.stream().mapToInt(i -> i).toArray();

  velPlot.setPointColors(colorsArr);
  accelPlot.setPointColors(colorsArr);

  background(10, 5, 30);
  translate(width/2 + 300, height/2, -500);

  velPlot.setPoints(vels);
  velPlot.beginDraw();
  velPlot.drawPoints();
  velPlot.drawYAxis();
  velPlot.drawXAxis();
  velPlot.endDraw();

  accelPlot.setPoints(accels);
  accelPlot.beginDraw();
  accelPlot.drawPoints();
  accelPlot.drawYAxis();
  accelPlot.drawXAxis();
  accelPlot.endDraw();

  if (frame % 10 == 0) {
    fps = (int)(1000/((System.currentTimeMillis() - time)/10));
    time = System.currentTimeMillis();
  }
  
  text("fps: " +  fps, 450, -450);


  rotateY(yrot);
  rotateX(xrot);


  p.draw();
  c.drawRecur(recur);

  lastFrameVel = p.velocity;
}

void keyPressed() {
  if (key == 'd') {
    recur += 1;
  }
  if (key == 'a' && recur > 1) {
    recur -= 1;
  }
  if (key == 'r' ) {
    setup();
  }
  if (key == 'f') {
    FILLTRIANGLE = !FILLTRIANGLE;
  }
}

boolean handleKeyDown() {
  if (keyPressed) {
    if (keyCode == UP) {
      xrot += .1;
    }
    if (keyCode == DOWN) {
      xrot -= .1;
    }
    if (keyCode == LEFT) {
      yrot -= .1;
    }
    if (keyCode == RIGHT) {
      yrot += .1;
    }
    if (key == ' ') {
      return true;
    }
  }
  return false;
}


void plotSetup() {
  vels = new GPointsArray(0);
  accels = new GPointsArray(0);

  velPlot = new GPlot(this, -1050, -500, 600, 400);

  accelPlot = new GPlot(this, -1050, 000, 600, 400);

  velPlot.getYAxis().setFontColor(255);
  velPlot.getYAxis().setLineColor(255);
  velPlot.getYAxis().setAxisLabelText("Speed (m/s)");
  velPlot.getYAxis().getAxisLabel().setFontColor(255);
  velPlot.getYAxis().getAxisLabel().setOffset(85);
  velPlot.getYAxis().setFontSize(24);
  velPlot.getYAxis().getAxisLabel().setFontSize(24);
  velPlot.getYAxis().setRotateTickLabels(false);

  velPlot.getXAxis().setFontColor(255);
  velPlot.getXAxis().setLineColor(255);
  velPlot.getXAxis().setAxisLabelText("Frame ("+ (speed*STEPLEN) + "s)");
  velPlot.getXAxis().getAxisLabel().setFontColor(255);
  velPlot.getXAxis().setFontSize(24);
  velPlot.getXAxis().getAxisLabel().setFontSize(24);


  accelPlot.getYAxis().setFontColor(255);
  accelPlot.getYAxis().setLineColor(255);
  accelPlot.getYAxis().setAxisLabelText("Acceleration (m/s^2)");
  accelPlot.getYAxis().getAxisLabel().setFontColor(255);
  accelPlot.getYAxis().getAxisLabel().setOffset(85);
  accelPlot.getYAxis().setFontSize(24);
  accelPlot.getYAxis().getAxisLabel().setFontSize(24);
  accelPlot.getYAxis().setRotateTickLabels(false);

  accelPlot.getXAxis().setFontColor(255);
  accelPlot.getXAxis().setLineColor(255);
  accelPlot.getXAxis().setAxisLabelText("Frame ("+ (speed*STEPLEN) + "s)");
  accelPlot.getXAxis().getAxisLabel().setFontColor(255);
  accelPlot.getXAxis().setFontSize(24);
  accelPlot.getXAxis().getAxisLabel().setFontSize(24);
}
