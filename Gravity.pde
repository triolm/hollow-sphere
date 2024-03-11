import grafica.*;
//import peasy.*;
import java.io.FileWriter;
Icosahedron c;
//MassiveParticle c;
Person p;
int STEPLEN = 100*5;
int speed = 400;
float yrot;
float xrot;
double SCALE = .1e10;
int recur = 3;
boolean FILLTRIANGLE = false;

ArrayList<Double> accels = new ArrayList<Double>();
ArrayList<Double> particleY = new ArrayList<Double>();
ArrayList<Boolean> inSphere = new ArrayList<Boolean>();

Vector3D lastFrameVel = new Vector3D(0, 0, 0);
GPointsArray points;
int frame = 0;
GPlot plot;

//PeasyCam cam;
void setup() {
  SCALE = .1e10;
  recur = 3;
  //cam = new PeasyCam(this, 100);
  size(1600/2, 900/2, P3D);
  c = new Icosahedron(new Point(0, 0, 0), 10e10, 5e30d);
  //c = new Tetrahedron(new Point(0, 0, 0), 20e10, 1.9e30d);
  p = new Person(new Point(0, 40e10, 0));
  //p.applyAccel(new Vector3D(0, -3000/STEPLEN, 0));
  background(10, 5, 20);


  points = new GPointsArray(particleY.size());
  plot = new GPlot(this, -850, -500, 600, 400);

  plot.getYAxis().setFontColor(255);
  plot.getYAxis().setLineColor(255);
  plot.getYAxis().setAxisLabelText("Speed (m/s)");
  plot.getYAxis().getAxisLabel().setFontColor(255);
  plot.getYAxis().getAxisLabel().setOffset(85);
  plot.getYAxis().setFontSize(24);
  plot.getYAxis().getAxisLabel().setFontSize(24);
  plot.getYAxis().setRotateTickLabels(false);

  plot.getXAxis().setFontColor(255);
  plot.getXAxis().setLineColor(255);
  plot.getXAxis().setAxisLabelText("Frame ("+ (speed*STEPLEN) + "s)");
  plot.getXAxis().getAxisLabel().setFontColor(255);
  plot.getXAxis().setFontSize(24);
  plot.getXAxis().getAxisLabel().setFontSize(24);
}

void draw() {
  frame ++;

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
      frame --;
      return;
    }
  }

  for (int i = 0; i < speed; i ++) {
    p.applyAccel(c.gravAccelRecur(p, recur));
    p.step();
  }

  accels.add(lastFrameVel.norm());
  particleY.add(p.p.getY());

  lastFrameVel = p.velocity;

  points.add(new GPoint(frame, (float)lastFrameVel.norm()));

  background(40, 20, 80);
  translate(width/2, height/2, -500);

  plot.setPoints(points);

  plot.beginDraw();
  plot.drawPoints();
  plot.drawYAxis();
  plot.drawXAxis();
  plot.endDraw();

  rotateY(yrot);
  rotateX(xrot);

  p.draw();
  c.drawRecur(recur);



  //inSphere.add(Math.abs(p.p.getY()) < Math.sqrt(Math.pow(c.PHI,2) + Math.pow(c.r,2)));
  //println(p.velocity.norm() - lastFrameVel.norm());
}

void keyPressed() {
  if (key == 'd') {
    recur += 1;
  }
  if (key == 'a' && recur > 0) {
    recur -= 1;
  }
  if (key == 'r' ) {
    setup();
  }
  if (key == 'f') {
    FILLTRIANGLE = !FILLTRIANGLE;
  }
  //if (key == 's' ) {
  //  try {
  //    writeFile();
  //  }
  //  catch(Exception e) {
  //    print(e);
  //  }
  //}
}

//void writeFile() throws Exception {

//  PrintWriter writer = createWriter("./out/accels.txt");;
//  for (Double str : accels) {
//    writer.println(str + System.lineSeparator());
//  }
//  writer.close();

//  writer = createWriter("./out/playerY.txt");;
//  for (Double str : particleY) {
//    writer.println(str + System.lineSeparator());
//  }
//  writer.close();
//  writer = createWriter("./out/inSphere.txt");;
//  for (Boolean str : inSphere) {
//    writer.println(str + System.lineSeparator());
//  }
//  writer.close();
//  print("lsdkfjdlskfj");
//}
