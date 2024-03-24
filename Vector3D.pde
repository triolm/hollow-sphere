class Vector3D {
  double x, y, z;

  public Vector3D(double x, double y, double z) {
    this.x=x;
    this.y=y;
    this.z=z;
  }


  public Vector3D(double theta, double phi, double r, boolean polar) {
    if (polar) {
      this.x = r * Math.sin(theta) * Math.cos(phi);
      this.y = r *  Math.sin(theta) *  Math.sin(phi);
      this.z = r *  Math.cos(theta);
      return;
    }
    //oh no
    this.x = theta;
    this.y = phi;
    this.z = r;
  }

  public Vector3D cross(Vector3D v) {
    double newX = y * v.getZ() - z * v.getY();
    double newY = z * v.getX() - x * v.getZ();
    double newZ = x * v.getY() - y * v.getX();
    return new Vector3D(newX, newY, newZ);
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


  public Vector3D rotateX(double theta) {
    return new Vector3D(
      this.getX(),
      this.getY() * Math.cos(theta) - this.getZ() * Math.sin(theta),
      this.getY() * Math.sin(theta) + this.getZ() * Math.cos(theta));
  }

  public Vector3D rotateY(double theta) {
    return new Vector3D(
      this.getX() * Math.cos(theta) + this.getZ() * Math.sin(theta),
      this.getY(),
      -this.getX() * Math.sin(theta) + this.getZ() * Math.cos(theta));
  }

  public Vector3D rotateZ(double theta) {
    return new Vector3D(
      this.getX() * Math.cos(theta) - this.getY() * Math.sin(theta),
      this.getX() * Math.sin(theta) + this.getY() * Math.cos(theta),
      this.getZ());
  }

  public Vector3D rotateAll(double theta) {
    return this.rotateX(theta).rotateY(theta).rotateZ(theta);
  }

  public Vector3D rotateYZ(double theta) {
    return this.rotateY(theta).rotateZ(theta);
  }

  public Point point() {
    return new Point(this.getX(), this.getY(), this.getZ());
  }
}
