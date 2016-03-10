public class Scope2 {
static int z = 5;

	public static void main(String[] args) {
		System.out.println(z);
		int u = z;
		System.out.println(z);
		float z = 5.5f;
		System.out.println(z);
		System.out.println(u);
		/* ERROR can not reuse automatic variable names */
		{ int z = u;}
	}
}
