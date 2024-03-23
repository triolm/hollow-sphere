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

  xrot= 0;
  yrot= 0;

  rotateY(yrot);
  rotateX(xrot);

  p = new PointMass(new Point(0, 0, 0), 6.47e6, 5.9e24, color(255, 255, 255));


  Vector3D startPos = new Vector3D(6.47e6 * 1.4, 0, 0);
  Vector3D startVel = new Vector3D(0, 1, 0);

  for ( int i = 0; i < 5; i ++) {
    MassiveParticle q = new PointMass(startPos.rotateAll(i * Math.PI / 3).point(), 3 *1e5, 4e5, color(0, 0, 255));
    q.velocity = startVel.rotateAll(i * Math.PI / 3).normalize().scale(Math.sqrt(G * p.getMass()/ p.centroid().dist(q.centroid())));

    satelites.add(q);
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
  }
  return false;
}
