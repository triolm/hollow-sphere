class Icosahedron extends MassiveParticle {
  Triangle[] triangles;
  double r;
  double PHI;
  public Icosahedron(Point p, double r, double mass) {
    super(p, mass);
    this.r = r;
    this.PHI = (1.0 + Math.sqrt(5.0))/2.0 * r;

    // Define 12 vertices of the icosahedron
    Point[] vertices = {
      new Point(PHI, r, 0),
      new Point(PHI, -r, 0),
      new Point(-PHI, -r, 0),
      new Point(-PHI, r, 0),
      new Point(r, 0, PHI),
      new Point(-r, 0, PHI),
      new Point(-r, 0, -PHI),
      new Point(r, 0, -PHI),
      new Point(0, PHI, r),
      new Point(0, PHI, -r),
      new Point(0, -PHI, -r),
      new Point(0, -PHI, r)
    };

    triangles = new SphereTriangle[]{
      //top
      new SphereTriangle(vertices[11], vertices[2], vertices[10], mass/20, this.centroid()),
      new SphereTriangle(vertices[11], vertices[1], vertices[10], mass/20, this.centroid()),
      new SphereTriangle(vertices[11], vertices[1], vertices[4], mass/20, this.centroid()),
      new SphereTriangle(vertices[11], vertices[5], vertices[4], mass/20, this.centroid()),
      new SphereTriangle(vertices[11], vertices[5], vertices[2], mass/20, this.centroid()),


      new SphereTriangle(vertices[9], vertices[6], vertices[7], mass/20, this.centroid()),
      new SphereTriangle(vertices[9], vertices[6], vertices[3], mass/20, this.centroid()),
      new SphereTriangle(vertices[9], vertices[8], vertices[3], mass/20, this.centroid()),
      new SphereTriangle(vertices[9], vertices[8], vertices[0], mass/20, this.centroid()),
      new SphereTriangle(vertices[9], vertices[0], vertices[7], mass/20, this.centroid()),


      new SphereTriangle(vertices[5], vertices[4], vertices[8], mass/20, this.centroid()),
      new SphereTriangle(vertices[0], vertices[4], vertices[8], mass/20, this.centroid()),
      new SphereTriangle(vertices[0], vertices[4], vertices[1], mass/20, this.centroid()),
      new SphereTriangle(vertices[0], vertices[7], vertices[1], mass/20, this.centroid()),
      new SphereTriangle(vertices[10], vertices[7], vertices[1], mass/20, this.centroid()),

      new SphereTriangle(vertices[10], vertices[7], vertices[6], mass/20, this.centroid()),
      new SphereTriangle(vertices[10], vertices[2], vertices[6], mass/20, this.centroid()),
      new SphereTriangle(vertices[3], vertices[2], vertices[6], mass/20, this.centroid()),
      new SphereTriangle(vertices[3], vertices[2], vertices[5], mass/20, this.centroid()),
      new SphereTriangle(vertices[3], vertices[8], vertices[5], mass/20, this.centroid())

    };
  }

  public Point centroid() {
    return new Point(0, 0, 0);
  }

  public double PHI() {
    return this.PHI;
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

  public void draw() {
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255, 255, 255);
    //square((float)(centroid().getX()/ SCALE), (float)(centroid().getY() / SCALE), (float)(r / SCALE));
    //noFill();
    beginShape(POINTS);
    for (Triangle i : triangles) {
      i.draw();
    }
    endShape();
    textSize(100);
  }
}
