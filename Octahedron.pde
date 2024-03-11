class Octahedron extends TriangulatedParticle {
  double r;
  public Octahedron(Point p, double r, double mass) {
    super(p, r, mass);
    this.r = r;
    Triangle[] triangles;
    // Define 12 vertices of the icosahedron
    Point[] vertices = {
      new Point(r, r, 0),
      new Point(r, -r, 0),
      new Point(-r, r, 0),
      new Point(-r, -r, 0),
      new Point(0, 0, Math.sqrt(8.0)/2 * r),
      new Point(0, 0, -Math.sqrt(8.0)/2 * r),
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
