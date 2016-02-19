package week9.sample.code;

import java.awt.Color;
import java.util.HashMap;
import java.util.Map;


class Parent3 {
	public static final Map<String,Color> FAV_COLORS = new HashMap<String,Color>();
	static {
		FAV_COLORS.put("Romeo", Color.GREEN);
		FAV_COLORS.put("Juliet", Color.MAGENTA);
		FAV_COLORS.put("Adam", Color.GREEN);
		FAV_COLORS.put("Eve", Color.GREEN);
	}
	private int x = 11;
		
	public int method1() {
		return x;
	}
	public Parent3() {
		//initialize fields
		System.out.println(x); 
		System.out.println(method1()); 
	}
}

class Child3 extends Parent3 {
	private int y = 777;
	
	public int method1() {
		return y;
	}	
	public Child3() {
		// call to super() inserted by Java
		// next fields are initialized
		System.out.println(method1()); 		
	}
}

public class PeculiarLateBindingConstructors2 {
	
	public static void main(String[] args) {
		Color c = Parent3.FAV_COLORS.get("Romeo");
		//new Child3();
	}

}

