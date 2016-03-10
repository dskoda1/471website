
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;
/**
 * BookCompany contains an inventory of Book.  
 * Book is a private nested class.
 * The sorting algorithm provided in Collections is used to sort
 * the inventory of books.
 * Inorder to use the provided sort(), the ordering of the Book objects 
 * are provided in the inner class Book.BookComparator.  Book.BookComparator
 * implements java.util.Comparator.
 **/
public class BookCompany {
    ArrayList inventory = new ArrayList(); // allows for duplicate books
    public void addBook(String title, int year) {
	inventory.add(new Book(title,year));
    }
    public void removeBook(String title, int year){
	Book book = new Book(title,year);
	int indexOf = inventory.indexOf(book);
	if (indexOf>-1) inventory.remove(indexOf);
    }
    public void sortInventory(){
	Collections.sort(inventory,BookCompany.Book.comparator );
    }
    public String toString(){
	return inventory.toString();
    }
    public static void main(String[] arg) {
	BookCompany company = new BookCompany();
	company.addBook("Algorithms in C",1998);
	company.addBook("C",1978);
	company.addBook("C",1988);
	company.addBook("Algorithms",1990);
	company.addBook("Art of Computer Programming",1978);
	company.addBook("Fortran", 1965);
	company.addBook("The Practice of Programming", 1999);
	System.out.println("Inventory:\n"+company);
	company.sortInventory();
	System.out.println("\nInventory sorted: \n"+company);
    }

    static private class Book {
	String title;
	int year;
	static Comparator comparator = new BookComparator();
	Book (String title, int year) {
	    this.title = title;
	    this.year = year;
	}
	public String toString (){
	    return ("\n ("+title+ ","+ year+") ");
	}
	public boolean equals(Object obj){
	    // Assumes obj is of type Book
	    return (
		    (((Book)obj).title).equals(title)&& 
		    ((Book)obj).year==year);
	}
	static class BookComparator implements Comparator {
	    public int compare (Object obj1, Object obj2){
		if (((Book)obj1).year < ((Book)obj2).year ) return -1;
		if (((Book)obj1).year > ((Book)obj2).year ) return 1;
		return (((Book)obj1).title).compareTo(((Book)obj2).title);
	    }
	}// end of BookComparator
    }// End of Book

}//End of Book Company


