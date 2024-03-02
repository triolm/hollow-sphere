Cube c ;
Person p;


void setup() {
  size(1600/2, 900/2);
  c = new Cube(new Point(0, 0, 0), 1, 10e10);
  p = new Person(new Point(100, 10, 10));
  p.applyAccel(new Vector3D(0, 2, 0));
}

void draw() {
  background(10, 5, 20);

  translate(width/2, height/2);
  p.draw();
  c.draw();
  p.applyAccel(c.gravAccelRecur(p, 2));
  p.step();
  System.out.println(p.centroid().getY());
}
