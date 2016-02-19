import java.awt.Color;
public class ColorPoint extends Point {
    
    private Color color = Color.white;
    public ColorPoint (){

    }
    public ColorPoint (double x, double y , Color color) {
	super(x,y);
	this.color = color;
    }
    public void clear() {
        super.clear();
	color = Color.white;
    }
    public Point newNear (Point p) {
	return new ColorPoint ( (p.getX()-getX())/2.0, 
				(p.getY() -getY())/2.0 ,
				 color);
    }
    public String toString() {
	return "ColorPoint\n          (" +getX() +",\n           "
	    + getY()+",\n          "
	    + color+" )" ;
    }
}

