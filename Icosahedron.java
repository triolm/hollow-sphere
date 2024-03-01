public class Icosahedron extends MassiveParticle {
    static double PHI = (1.0 + Math.sqrt(5.0))/2.0;
    Triangle[] triangles;

    public Icosahedron(double r){
        Point[] points = new Point[20];

        points[1] = new Point(PHI,1,0);
        points[2] = new Point(PHI,-1,0);
        points[3] = new Point(-PHI,-1,0);
        points[4] = new Point(-PHI,1,0);
        points[5] = new Point(1,0,PHI);
        points[6] = new Point(-1,0,PHI);
        points[7] = new Point(-1,0,-PHI);
        points[8] = new Point(1,0,-PHI);
        points[9] = new Point(0,PHI,1);
        points[10] = new Point(0,PHI,-1);
        points[11] = new Point(0,-PHI,-1);
        points[12] = new Point(0,-PHI,1);
    }

    public Point centroid(){
        return new Point(0,0,0);
    }

    public double getMass(){
        double mass = 0;
        for (Triangle i : triangles){
            mass += i.getMass();
        }
        return mass;
    }

    public Triangle[] section(){
        return triangles;
    }

}
