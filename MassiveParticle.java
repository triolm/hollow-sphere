public abstract class MassiveParticle extends Particle {
    static double G = 6.67e-11;
    public abstract double getMass();


    public Vector3D gravAccel(Particle p){
        double accel = MassiveParticle.G * (this.getMass()) / (this.centroid().dist(p.centroid()));
        return this.centroid().subtract(p.centroid()).scale(accel);
    }

    public abstract MassiveParticle[] section();

    public Vector3D gravAccelRecur(Particle p, double depth){
        Vector3D v = new Vector3D(0,0,0);
        if(depth <= 0) return gravAccel(p);
        for(MassiveParticle i:this.section()){
            v = v.add(i.gravAccelRecur(p, depth-1));
        }        
        return v;
    }

}
