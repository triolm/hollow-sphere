public class Person extends Particle {
    Point p;

    public Person(Point p){
        this.p = p;
    }

    public Point centroid() {
        return p;
    }
}
