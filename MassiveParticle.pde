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
}
