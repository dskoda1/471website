import java.awt.Color;
public class TestDriver {
    void test1() {
	// static type Point, dynamic type Point
	Point p1 = new Point(3.5, 2.5); 
	// static type ColorPoint, dynamic type ColorPoint
	ColorPoint p2 = new ColorPoint( 3.0,2.0,Color.red);
	// Arguments to the constuctor are static type Point.
	Line line = new Line(p1,p2);
	System.out.println ("Line =\n  "+ line 
			    + "\n     with slope, "+ line.slope()
			    + " and intercept, "+line.intercept()+ "\n");
	Point p3;
	p3 = p2.newNear(p1);
	line = new Line(p3,p2);
	System.out.println ("\nLine =\n  "+ line 
			    + "\n     with slope, "+ line.slope()
			    + " and intercept, "+line.intercept()+ "\n");
	
    }
    static public void main( String [] arg){
	TestDriver tester = new TestDriver();
	tester.test1();
    }
}

