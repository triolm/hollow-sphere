class Tetrahedron extends TriangulatedParticle {
  double r;
  public Tetrahedron(Point p, double r, double mass) {
    super(p,r, mass);
    this.r = r;
      Triangle[] triangles;

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
    setTriangles(triangles);
  }

  public Point centroid() {
    return new Point(0, 0, 0);
  }

}
