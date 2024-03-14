double PHI = (1.0 + Math.sqrt(5.0))/2.0;
class Icosahedron extends TriangulatedParticle {
  double r;
  double s;
  public Icosahedron(Point p, double r, double mass) {
    super(p, r, mass);
    this.r = r;

    this.s = Math.sqrt(Math.pow(r, 2)/(Math.pow(PHI, 2) +1));

    Triangle[] triangles;

    Point[] vertices = {
      new Point(PHI * s + centroid().getX(), s+ centroid().getY(), 0 + centroid().getZ()),
      new Point(PHI * s + centroid().getX(), -s+ centroid().getY(), 0 + centroid().getZ()),
      new Point(-PHI * s + centroid().getX(), -s+ centroid().getY(), 0 + centroid().getZ()),
      new Point(-PHI * s + centroid().getX(), s + centroid.getY(), 0 + centroid().getZ()),
      new Point(s + centroid().getX(), 0+ centroid().getY(), PHI * s + centroid().getZ()),
      new Point(-s + centroid().getX(), 0+ centroid().getY(), PHI * s + centroid().getZ()),
      new Point(-s + centroid().getX(), 0+ centroid().getY(), -PHI * s + centroid().getZ()),
      new Point(s + centroid().getX(), 0+ centroid().getY(), -PHI * s + centroid().getZ()),
      new Point(0 + centroid().getX(), PHI * s+ centroid().getY(), s + centroid().getZ()),
      new Point(0 + centroid().getX(), PHI * s+ centroid().getY(), -s + centroid().getZ()),
      new Point(0 + centroid().getX(), -PHI * s+ centroid().getY(), -s + centroid().getZ()),
      new Point(0 + centroid().getX(), -PHI * s+ centroid().getY(), s + centroid().getZ())
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
    setTriangles(triangles);
  }
}
