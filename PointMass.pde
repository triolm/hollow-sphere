class PointMass extends MassiveParticle{
    double radius;
    Point pos;
    color c; 
    
    public PointMass(Point pos, double radius,double mass, color c) {
        super(pos, mass); 
        this.radius = radius;
        this.c = c;
    }
    
    public void setCentroid(Point p) {
        pos = p;
    }

    public Point centroid(){
        return pos;
    }

    public PointMass[] section(){
        PointMass[] p  = {this};
        return p;
    }
 
    
    void draw() {
        stroke(c);
        fill(0,0,0);
        translate((float)(pos.getX()/SCALE), (float)(pos.getY()/SCALE), (float)(pos.getZ()/SCALE));
        // println((float)(pos.getX()/SCALE) + " " +  (float)(pos.getY()/SCALE) + " " + (float)(pos.getZ()/SCALE));
        sphere((float)(radius/SCALE));
        translate(-(float)(pos.getX()/SCALE), -(float)(pos.getY()/SCALE), -(float)(pos.getZ()/SCALE));

    }
}
