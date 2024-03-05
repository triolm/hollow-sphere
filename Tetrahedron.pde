class Tetrahedron extends MassiveParticle {
  Triangle[] triangles;
  double r;
  public Tetrahedron(Point p, double r, double mass) {
    super(p, mass);
    this.r = r;
    // Define 12 vertices of the icosahedron
    Point[] vertices = {
      new Point(r,r,r),
      new Point(-r,-r,r),
      new Point(r,-r,-r),
      new Point(-r,r,-r)
    };

    triangles = new SphereTriangle[]{
      //top
      new SphereTriangle(vertices[0], vertices[1], vertices[2], mass/4, this.centroid()),
      new SphereTriangle(vertices[0], vertices[1], vertices[3], mass/4, this.centroid()),
      new SphereTriangle(vertices[0], vertices[2], vertices[3], mass/4, this.centroid()),
      new SphereTriangle(vertices[1], vertices[2], vertices[3], mass/4, this.centroid()),

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
