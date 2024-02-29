public class Triangle implements Particle {
    Point[] vertices;

    public Triangle(Point a, Point b, Point c){
        vertices = new Point[3];
        vertices[0] = a;
        vertices[1] = b;
        vertices[2] = c;
    }

    public Point centroid(){
        double x = (vertices[0].getX() + vertices[1].getX() + vertices[2].getX()) / 3;
        double y = (vertices[0].getY() + vertices[1].getY() + vertices[2].getY()) / 3;
        double z = (vertices[0].getZ() + vertices[1].getZ() + vertices[2].getZ()) / 3;
        return new Point(x,y,z);
    }
}
