public class Triangle extends MassiveParticle{
    Point[] vertices;
    double mass;

    public Triangle(Point a, Point b, Point c, double mass){
        vertices = new Point[3];
        vertices[0] = a;
        vertices[1] = b;
        vertices[2] = c;
        this.mass = mass;
    }

    public Point centroid(){
        double x = (vertices[0].getX() + vertices[1].getX() + vertices[2].getX()) / 3;
        double y = (vertices[0].getY() + vertices[1].getY() + vertices[2].getY()) / 3;
        double z = (vertices[0].getZ() + vertices[1].getZ() + vertices[2].getZ()) / 3;
        return new Point(x,y,z);
    }

    public double getMass(){
        return mass;
    }

    public Triangle[] section(){
        Triangle[] t = {this};
        return t;
    }
}
