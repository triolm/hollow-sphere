abstract class MassiveParticle extends Particle {
  double G = 6.67e-11;
  public double mass;

  public MassiveParticle(Point pos, double mass) {
    super(pos);
    this.mass = mass;
  }

  public Vector3D gravAccel(Particle p) {
    double accel = G * (this.getMass()) / Math.pow(this.centroid().dist(p.centroid()), 2);
    return this.centroid().subtract(p.centroid()).normalize().scale(accel);
  }

  public abstract MassiveParticle[] section();

  public double getMass() {
    return mass;
  }

  public Vector3D gravAccelRecur(Particle p, double depth) {
    Vector3D v = new Vector3D(0, 0, 0);
    if (depth <= 0) return gravAccel(p);
    for (MassiveParticle i : this.section()) {
      v = v.add(i.gravAccelRecur(p, depth-1));
    }
    return v;
  }

  void drawRecur(int depth) {
    if (depth <= 0) {
      this.draw();
      return;
    };
    for (MassiveParticle i : this.section()) {
      i.drawRecur(depth-1);
    }
  }
}

abstract class TriangulatedParticle extends MassiveParticle {
  Triangle[] triangles;
  double r;
  Point centroid;

  public TriangulatedParticle(Point p, double r, double mass) {
    super(p, mass);
    this.r = r;
    this.centroid = p;
  }

  void setTriangles(Triangle[] triangles) {
    this.triangles = triangles;
  }

  Triangle[] getTriangles() {
    return triangles;
  }

  double getR() {
    return this.r;
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

  public Point centroid() {
    return centroid;
  }
}
