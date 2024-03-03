class Triangle extends MassiveParticle {
  Point[] vertices;
  double mass;

  public Triangle(Point a, Point b, Point c, double mass) {
    super(a, mass);
    vertices = new Point[3];
    vertices[0] = a;
    vertices[1] = b;
    vertices[2] = c;
    this.mass = mass;
  }

  public Point centroid() {
    double x = (vertices[0].getX() + vertices[1].getX() + vertices[2].getX()) / 3;
    double y = (vertices[0].getY() + vertices[1].getY() + vertices[2].getY()) / 3;
    double z = (vertices[0].getZ() + vertices[1].getZ() + vertices[2].getZ()) / 3;
    return new Point(x, y, z);
  }

  public double getMass() {
    return mass;
  }

  public Triangle[] section() {
    Point ab = vertices[0].midpoint(vertices[1]);
    Point bc = vertices[1].midpoint(vertices[2]);
    Point ca = vertices[2].midpoint(vertices[0]);

    Triangle[] t = {
      new Triangle(vertices[0], ab, ca, mass/4),
      new Triangle(vertices[1], ab, bc, mass/4),
      new Triangle(vertices[2], bc, ca, mass/4),
      new Triangle(ab, bc, ca, mass/4)
    };
    return t;
  }

  public void setCentroid(Point p) {
  }



  void draw() {
    noFill();
    stroke(255, 255, 255, 150);
    //fill(0,0,0);
    strokeWeight(2);
    beginShape(TRIANGLES);
    vertices[0].draw();
    vertices[1].draw();
    vertices[2].draw();
    endShape();
  }
}

class SphereTriangle extends Triangle {
  Point origin;
  public SphereTriangle(Point a, Point b, Point c, double mass, Point origin) {
    super(a, b, c, mass);
    this.origin = origin;
  }

  public Triangle[] section() {
    double originDist = vertices[0].dist(origin);
    //println(originDist);

    Point ab = vertices[0].midpoint(vertices[1]);
    Point bc = vertices[1].midpoint(vertices[2]);
    Point ca = vertices[2].midpoint(vertices[0]);

    ab = origin.add(ab.subtract(origin).normalize().scale(originDist));
    bc = origin.add(bc.subtract(origin).normalize().scale(originDist));
    ca = origin.add(ca.subtract(origin).normalize().scale(originDist));

    SphereTriangle[] t = {
      new SphereTriangle(vertices[0], ab, ca, mass/4, origin),
      new SphereTriangle(vertices[1], ab, bc, mass/4, origin),
      new SphereTriangle(vertices[2], bc, ca, mass/4, origin),
      new SphereTriangle(ab, bc, ca, mass/4, origin)
    };
    return t;
  }
}
