package week9.sample.code;


class Parent2 {
	private int x = 11;
	
	public int method1() {
		return x;
	}
	public Parent2() {
		System.out.println(method1()); 
	}
}

class Child2 extends Parent2 {
	private int y = 777;
	public Child2() {
		super();	
		// initialize instance vars
		System.out.println(method1()); 
	}
	@Override
	public int method1() {
		return y;
	}	
}

public class PeculiarLateBindingInConstructors {

	public static void main(String[] args) {
		new Child2();
		// calls the default constructor provided by Java
		// in the absence of any user-defined constructor(s).
		// Any constructor calls super() or super(...) first.
		// The call to the constructor of Parent2 in turn calls
		// method1 on the Child object being constructed. That
		// call uses late binding (dynamic dispatching) to call
		// method1 in Child BEFORE the fields have been
		// initialized.
	}

}
