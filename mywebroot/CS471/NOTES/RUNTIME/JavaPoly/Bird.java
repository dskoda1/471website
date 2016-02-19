package poly;
public class Bird extends Animal {
    void move(Animal a){
	System.out.println ("Bird: Code 2");
    }
    Animal ted;
    void fly(){
	ted = new Animal(); // dynamic type Animal
	this.move (ted);
	ted.move(ted);
	ted = new Bird();
	this.move(ted);
	ted.move(ted);
    }
    public static void main (String [] a) {
	Bird me = new Bird();
	me.fly();
    }

	
}
