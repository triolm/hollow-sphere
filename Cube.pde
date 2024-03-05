class Cube extends MassiveParticle {
  SphereTriangle[] triangles;
  double r;
  public Cube(Point p, double r, double mass) {
    super(p, mass);
    this.r = r;
    Point[] vertices = {
      new Point(-r, -r, -r), new Point(-r, -r, r), new Point(-r, r, -r), new Point(-r, r, r),
      new Point(r, -r, -r), new Point(r, -r, r), new Point(r, r, -r), new Point(r, r, r)
    };

    double tMass = this.mass/16;
    triangles = new SphereTriangle[]{
      new SphereTriangle(vertices[0], vertices[1], vertices[2], tMass, p),
      new SphereTriangle(vertices[1], vertices[2], vertices[3], tMass, p),

      new SphereTriangle(vertices[4], vertices[5], vertices[6], tMass, p),
      new SphereTriangle(vertices[5], vertices[6], vertices[7], tMass, p),

      new SphereTriangle(vertices[0], vertices[1], vertices[4], tMass, p),
      new SphereTriangle(vertices[1], vertices[4], vertices[5], tMass, p),

      new SphereTriangle(vertices[2], vertices[3], vertices[6], tMass, p),
      new SphereTriangle(vertices[3], vertices[6], vertices[7], tMass, p),

      new SphereTriangle(vertices[0], vertices[2], vertices[4], tMass, p),
      new SphereTriangle(vertices[2], vertices[4], vertices[6], tMass, p),

      new SphereTriangle(vertices[1], vertices[3], vertices[5], tMass, p),
      new SphereTriangle(vertices[3], vertices[5], vertices[7], tMass, p),

    };
  }

  public Point centroid() {
    return new Point(0, 0, 0);
  }

  public double getMass() {
    double mass = 0;
    for (SphereTriangle i : triangles) {
      mass += i.getMass();
    }
    return mass;
  }

  public SphereTriangle[] section() {
    return triangles;
  }

  public void setCentroid(Point p) {
  }

  public void draw() {
    rectMode(CENTER);
    fill(0, 0, 0, 0);
    stroke(255, 255, 255);
    //square((float)(centroid().getX()/ SCALE), (float)(centroid().getY() / SCALE), (float)(r / SCALE));
    for (SphereTriangle i : triangles) {
      i.draw();
    }
    //rotateY(0.5);
    //box((float)(r/SCALE));
  }
}
