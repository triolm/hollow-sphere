public class Main{
    public static void main(String[] args){
        Cube c = new Cube(0, 1600000000);
        Person p = new Person(new Point(0, 0, 0));

        System.out.println(c.gravAccelRecur(p,3).norm());
    }
}