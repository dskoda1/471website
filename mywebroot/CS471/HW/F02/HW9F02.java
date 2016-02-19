package hw9;

/**
 * @author head
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class HW9F02 {
    private int [] [] array;
    public HW9F02(int r,int c){
	array = new int [r] [c];
    }
    
    
    
    public static void main(String[] args) {
	long startTime = System.currentTimeMillis();
	HW9F02 row = new HW9F02(2,1000000); 
	long stopTime = System.currentTimeMillis();
	System.out.println(
			   "Created a 2 by 1000000 array\nTotal System run time = "
		    + (stopTime-startTime)
			   ); 
	
	startTime = System.currentTimeMillis();
	row = new HW9F02(1000000,2); 
	stopTime = System.currentTimeMillis();
	System.out.println(
                 "Created a 1000000 by 2 array\nTotal System run time = "
		 + (stopTime-startTime)
		 );
      
	
    }
}
