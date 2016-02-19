package poly;
public class Mammal extends Animal {
    Animal ted;
    void move(Mammal x )  {
	System.out.println ("Mammal-Mammal: Code 2");
    } //overriden function

    void move(Animal a){
	System.out.println ("Mammal--Animal: Code 3");
    }


    void fly( ){

        ted = new Animal( );
        this.move(ted);   //  code 3 executed
        ted.move(ted);   //  code 1 executed
        ted = new Mammal( );
        this.move(ted);   //  code 3 executed
        ted.move(ted);  //  code 3 executed
        Mammal fred = new Mammal();
        fred.move(fred);  // code 2
        this.move(fred);  // code 2
        ted.move(fred);   // code 3

    }


    public static void main (String [] a) {
	Mammal me = new Mammal();
	me.fly();
    }

	
}
