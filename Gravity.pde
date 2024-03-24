double SCALE = 50000;
double STEPLEN = 1;
double stepsPerFrame = 50;
float xrot, yrot;

MassiveParticle p;

ArrayList<MassiveParticle> satelites;

void setup() {
  size(1200, 675, P3D);
  background(10, 5, 25);

  satelites = new ArrayList<MassiveParticle>();

  //xrot= 0;
  //yrot= 0;

  p = new PointMass(new Point(0, 0, 0), 6.47e6, 5.9e24, color(255, 255, 255));


  //Vector3D startPos = new Vector3D(6.47e6 * 1.4, 0, 0);
  //Vector3D startVel = new Vector3D(0, 1, 0);
  //color(i/4 < 3 ? 100 : 255, i/4 % 2 == 0 ? 100 : 255, i/4 == 2 || i/4 == 3 ? 100 : 255)
  Vector3D[] starts = { new Vector3D(6.47e6 * 1.4, 0, 0), new Vector3D(0, 0, 6.47e6 * 1.4), new Vector3D(-6.47e6 * 1.4, 0, 0), new Vector3D(0, 0, -6.47e6 * 1.4)};
  Vector3D[] startVels = { new Vector3D(0, 0, 1), new Vector3D(-1, 0, 0), new Vector3D(0, 0, -1), new Vector3D(1, 0, 0)};
  color[] colors = {color(255, 0, 0), color(255, 150, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255), color(150, 0, 255)};

  for ( int i = 0; i < 6; i ++) {
    for (int j = 0; j < 4; j ++) {

      Vector3D v = starts[j]
        .rotateY(i * (Math.PI / 12))
        //rotate orbital plane
        .rotateZ(Math.toRadians(55.0))
        .rotateY(i * Math.PI / 3.0);

      print(i + "," + j + ": ");
      //println(v);

      MassiveParticle q = new PointMass(v.point(), 3 *1e5, 4e5,
        colors[i]);

      q.velocity = startVels[j]
        .rotateY(i * (Math.PI / 12))
        .rotateZ(Math.toRadians(55.0))
        .rotateY(i * Math.PI / 3.0)
        //scale so orbit is perfect circle
        .scale(Math.sqrt(G * p.getMass()/ p.centroid().dist(q.centroid())));


      println(q.velocity.dot(v));
      //println(v.cross(v));

      satelites.add(q);
    }
  }
}


void draw() {
  background(10, 5, 25);
  translate(width/2, height/2, -500);

  handleKeyDown();
  rotateY(yrot);
  rotateX(xrot);
  if (keyPressed && key == ' ') {

    for (int i = 0; i < stepsPerFrame; i ++) {
      for (MassiveParticle j : satelites) {
        j.applyAccel(p.gravAccel(j));
        j.step();
      }
    }
  }
  //println(q.velocity.norm());
  p.draw();
  for (MassiveParticle j : satelites) {
    j.draw();
  }
}


boolean handleKeyDown() {
  if (keyPressed) {
    if (keyCode == UP) {
      xrot += .1;
    }
    if (keyCode == DOWN) {
      xrot -= .1;
    }
    if (keyCode == LEFT) {
      yrot -= .1;
    }
    if (keyCode == RIGHT) {
      yrot += .1;
    }
    if (key == 'r') {
      setup();
    }
  }
  return false;
}
