public class Line {

    public Point point1;  // instance variable: static type point
    public Point point2;
    public Line (Point p1, Point p2){
	point1 = p1;
	point2 = p2;
    }

    public double length () {
	return point1.distance(point2);
    }

    public double slope() {
	return (point1.getY() - point2.getY()) 
	       / (point1.getX() -point2.getX());
    }
    public double intercept(){
	return (point2.getY() - slope()* point2.getX());
    }
    public String toString(){
	return "Line( "+point1+ ", \n        "+point2+" )\n" ;  
    }
}

