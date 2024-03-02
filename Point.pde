class Point {
  double x, y, z;

  public Point(double x, double y, double z) {
    this.x=x;
    this.y=y;
    this.z=z;
  }

  public double getX() {
    return this.x;
  }
  public double getY() {
    return this.y;
  }
  public double getZ() {
    return this.z;
  }

  public Point add(Vector3D other) {
    return new Point(this.x + other.x, this.y + other.y, this.z + other.z);
  }

  public double dist(Point other) {
    return Math.sqrt(
      Math.pow(this.x- other.x, 2) +
      Math.pow(this.y- other.y, 2) +
      Math.pow(this.z- other.z, 2)
      );
  }

  public Vector3D subtract(Point other) {
    return new Vector3D(this.x - other.x, this.y - other.y, this.z - other.z);
  }

  public String toString() {
    return this.getX() + ", " + this.getY() + "," + this.getZ();
  }
}
