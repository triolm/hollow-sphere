class Octahedron extends TriangulatedParticle {
  double r;  
  double s;

  public Octahedron(Point p, double r, double mass) {
    super(p, r, mass);
    this.r = r;
    this.s =  r / Math.sqrt(2.0);
    Triangle[] triangles;
    // Define 12 vertices of the icosahedron
    Point[] vertices = {
      new Point(s + centroid().getX(), s + centroid().getY(), 0 + centroid().getZ()),
      new Point(s + centroid().getX(), -s + centroid().getY(), 0 + centroid().getZ()),
      new Point(-s + centroid().getX(), s + centroid().getY(), 0 + centroid().getZ()),
      new Point(-s + centroid().getX(), -s + centroid().getY(), 0 + centroid().getZ()),
      new Point(0 + centroid().getX(), 0 + centroid().getY(), Math.sqrt(8.0)/2 * s + centroid().getZ()),
      new Point(0 + centroid().getX(), 0 + centroid().getY(), -Math.sqrt(8.0)/2 * s + centroid().getZ()),
    };

    triangles = new SphereTriangle[]{
      //top
      new SphereTriangle(vertices[0], vertices[1], vertices[4], mass/4, this.centroid()),
      new SphereTriangle(vertices[0], vertices[2], vertices[4], mass/4, this.centroid()),
      new SphereTriangle(vertices[1], vertices[3], vertices[4], mass/4, this.centroid()),
      new SphereTriangle(vertices[2], vertices[3], vertices[4], mass/4, this.centroid()),
      new SphereTriangle(vertices[0], vertices[1], vertices[5], mass/4, this.centroid()),
      new SphereTriangle(vertices[0], vertices[2], vertices[5], mass/4, this.centroid()),
      new SphereTriangle(vertices[1], vertices[3], vertices[5], mass/4, this.centroid()),
      new SphereTriangle(vertices[2], vertices[3], vertices[5], mass/4, this.centroid()),

    };
    setTriangles(triangles);
  }
}
