abstract class Particle {
  Vector3D velocity;

  public Particle(Point pos) {
    setCentroid(pos);
    velocity = new Vector3D(0, 0, 0);
  }

  public abstract Point centroid();

  public void applyAccel(Vector3D a) {
    velocity = velocity.add(a);
  }

  public void step() {
    setCentroid(centroid().add(velocity));
  }
  public abstract void setCentroid(Point p);

  public void draw() {
    circle((float)centroid().getX(), (float)centroid().getY(), 10);
  }
}
