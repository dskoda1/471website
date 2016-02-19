
public class Point {
    private double x = 0.0;
    private double y = 0.0;
    public Point (){
    }
    public Point (double x, double y) {
	this.x = x;
	this.y = y;
    }
    double getX(){
	return x;
    }
    double getY(){
	return y;
    }
    public void clear() {
	x = 0.0;
	y = 0.0;
    }
    public void move(double incX, double incY) {
	x =+ incX;
	y =+ incY;
    }
    public double distance (Point p) {
	return Math.sqrt (
			  (p.x -x)*(p.x -x) + 
			  (p.y -y)*(p.y -y)
			  );
    }
    public Point newNear (Point p) {
	return new Point ( (p.x-x)/2.0, (p.y -y)/2.0);
    }
    public String toString() {
	return "Point (" +x +", "+y+ " )" ;
    }
}

