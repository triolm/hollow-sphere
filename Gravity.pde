Cube c ;
Person p;
int STEPLEN = 1000;
int speed = 100000/STEPLEN;

double SCALE = .1e10;

void setup() {
  size(1600/2, 900/2);
  c = new Cube(new Point(0, 0, 0), 20e10, 1.9e30);
  p = new Person(new Point(0, 0, 10));
  p.applyAccel(new Vector3D(0, -3000/STEPLEN, 0));
  background(10, 5, 20);
}

void draw() {
  //background(10, 5, 20);
  translate(width/2, height/2);
  p.draw();
  c.draw();
  for (int i = 0; i < speed; i ++) {
    p.applyAccel(c.gravAccelRecur(p, 1));
    p.step();
  }
  //System.out.println(p.centroid());
}
