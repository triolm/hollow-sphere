class Vector3D {
  double x, y, z;

  public Vector3D(double x, double y, double z) {
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

  public Vector3D scale(double scalar) {
    return new Vector3D(scalar*x, scalar*y, scalar*z);
  }

  public Vector3D add(Vector3D other) {
    return new Vector3D(this.x + other.x, this.y + other.y, this.z + other.z);
  }

  public Vector3D subtract(Vector3D other) {
    return this.add(other.scale(-1));
  }

  public double dot(Vector3D other) {
    return (this.x * other.x) + (this.y * other.y) + (this.z * other.z);
  }

  public double norm() {
    return Math.sqrt(this.dot(this));
  }

  public Vector3D normalize() {
    return this.scale(1/this.norm());
  }

  public String toString() {
    return this.getX() + ", " + this.getY() + "," + this.getZ();
  }
}
