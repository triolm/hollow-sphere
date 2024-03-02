class Person extends Particle {
  Point p;

  public Person(Point p) {
    super(p);
  }

  public Point centroid() {
    return p;
  }

  public void setCentroid(Point p) {
    this.p  = p;
  }
}
