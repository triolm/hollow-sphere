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

class Tetrahedron extends TriangulatedParticle {
  double r;
  double s;
  public Tetrahedron(Point p, double r, double mass) {
    super(p, r, mass);
    this.r = r;
    this.s =  r / Math.sqrt(3.0);

    Triangle[] triangles;

    // Define 12 vertices of the icosahedron
    Point[] vertices = {
      new Point(s + centroid().getX(), s + centroid().getY(), s + centroid().getZ()),
      new Point(-s + centroid().getX(), -s + centroid().getY(), s + centroid().getZ()),
      new Point(s + centroid().getX(), -s + centroid().getY(), -s + centroid().getZ()),
      new Point(-s + centroid().getX(), s + centroid().getY(), -s + centroid().getZ())
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
class Cube extends TriangulatedParticle {
  double r;
  double s;
  public Cube(Point p, double r, double mass) {
    super(p, r, mass);
    SphereTriangle[] triangles;
    
    this.r = r;
    this.s =  r / Math.sqrt(3.0);
    
    Point[] vertices = {
      new Point(-s + centroid().getX(), -s + centroid().getY(), -s + centroid().getZ()), 
      new Point(-s + centroid().getX(), -s + centroid().getY(), s + centroid().getZ()), 
      new Point(-s + centroid().getX(), s + centroid().getY(), -s + centroid().getZ()), 
      new Point(-s + centroid().getX(), s + centroid().getY(), s + centroid().getZ()),
      new Point(s + centroid().getX(), -s + centroid().getY(), -s + centroid().getZ()), 
      new Point(s + centroid().getX(), -s + centroid().getY(), s + centroid().getZ()), 
      new Point(s + centroid().getX(), s + centroid().getY(), -s + centroid().getZ()), 
      new Point(s + centroid().getX(), s + centroid().getY(), s + centroid().getZ())
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
    setTriangles(triangles);
  }

  public Point centroid() {
    return new Point(0, 0, 0);
  }
}
