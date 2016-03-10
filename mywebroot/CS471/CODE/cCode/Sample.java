
public class Sample {
    static int n = 0; 
    static int [] A = new int[2];
    static int f() {
	if (n == 0) n=1;
	else n = 0;
	return n;
    }
    static public void main (String [] arg) {
	A[f()] = A[f()] +1; 	// 0 1  
	System.out.println("1A: " + A[0]+ ", " + A[1] );
	A[f()] += 1;	  	// 0 2
	System.out.println("2A: " + A[0]+ ", " + A[1] );
	A[0] = A[1] = n = 0;
	A[f()] += 1;		// 0 1
	System.out.println("3A: " + A[0]+ ", " + A[1] );
	A[f()] = A[f()] + 1; 	// 2 1 
	System.out.println("4A: " + A[0]+ ", " + A[1] );
    }
}
