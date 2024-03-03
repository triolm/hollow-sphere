abstract class Particle {
  Vector3D velocity;

  public Particle(Point pos) {
    setCentroid(pos);
    velocity = new Vector3D(0, 0, 0);
  }

  public abstract Point centroid();

  public void applyAccel(Vector3D a) {
    velocity = velocity.add(a.scale(STEPLEN));
  }

  public void step() {
    setCentroid(centroid().add(velocity.scale(STEPLEN)));
  }
  public abstract void setCentroid(Point p);

  public void draw() {
    strokeWeight(10);
    beginShape(POINTS);
    stroke(0, 255, 0);
    centroid().draw();
    endShape();
  }
}
