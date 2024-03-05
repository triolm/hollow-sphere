//import peasy.*;
MassiveParticle c;
Person p;
int STEPLEN = 1000;
int speed = 200000/STEPLEN;
float yrot;
float xrot;
double SCALE = .1e10;
int recur = 3;

Vector3D lastFrameVel = new Vector3D(0, 0, 0);
//PeasyCam cam;
void setup() {
  //cam = new PeasyCam(this, 100);
  size(1600/2, 900/2, P3D);
  c = new Icosahedron(new Point(0, 0, 0), 10e10, 5e29d);
  //c = new Tetrahedron(new Point(0, 0, 0), 20e10, 1.9e30d);
  p = new Person(new Point(0, 30e10, 0));
  //p.applyAccel(new Vector3D(0, -3000/STEPLEN, 0));
  background(10, 5, 20);
}

void draw() {

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
      return;
    }
  }

  background(40, 20, 80);
  translate(width/2, height/2, -500);
  rotateY(yrot);
  rotateX(xrot);

  p.draw();
  c.drawRecur(recur);
  for (int i = 0; i < speed; i ++) {
    p.applyAccel(c.gravAccelRecur(p, recur));
    p.step();
  }

  println(p.velocity.norm() - lastFrameVel.norm());
  lastFrameVel = p.velocity;
}

void keyPressed() {
  if (key == 'd') {
    recur += 1;
  }
  if (key == 'a' && recur > 0) {
    recur -= 1;
  }
}
