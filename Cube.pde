class Cube extends MassiveParticle {
  Triangle[] triangles;

  public Cube(Point p, double r, double mass) {
    super(p, mass);
    Point[] vertices = {
      new Point(-1, -1, -1), new Point(-1, -1, 1), new Point(-1, 1, -1), new Point(-1, 1, 1),
      new Point(1, -1, -1), new Point(1, -1, 1), new Point(1, 1, -1), new Point(1, 1, 1)
    };

    double tMass = this.mass/16;
    triangles = new Triangle[]{
      new Triangle(vertices[0], vertices[1], vertices[2], tMass),
      new Triangle(vertices[1], vertices[2], vertices[3], tMass),

      new Triangle(vertices[4], vertices[5], vertices[6], tMass),
      new Triangle(vertices[5], vertices[6], vertices[7], tMass),

      new Triangle(vertices[0], vertices[1], vertices[4], tMass),
      new Triangle(vertices[1], vertices[4], vertices[5], tMass),

      new Triangle(vertices[2], vertices[3], vertices[6], tMass),
      new Triangle(vertices[3], vertices[6], vertices[7], tMass),

      new Triangle(vertices[0], vertices[2], vertices[4], tMass),
      new Triangle(vertices[2], vertices[4], vertices[6], tMass),

      new Triangle(vertices[1], vertices[3], vertices[5], tMass),
      new Triangle(vertices[3], vertices[5], vertices[7], tMass),

      new Triangle(vertices[0], vertices[1], vertices[3], tMass),
      new Triangle(vertices[1], vertices[3], vertices[2], tMass),

      new Triangle(vertices[4], vertices[5], vertices[7], tMass),
      new Triangle(vertices[4], vertices[7], vertices[6], tMass)
    };
  }

  public Point centroid() {
    return new Point(0, 0, 0);
  }

  public double getMass() {
    double mass = 0;
    for (Triangle i : triangles) {
      mass += i.getMass();
    }
    return mass;
  }

  public Triangle[] section() {
    return triangles;
  }

  public void setCentroid(Point p) {
  }
}
