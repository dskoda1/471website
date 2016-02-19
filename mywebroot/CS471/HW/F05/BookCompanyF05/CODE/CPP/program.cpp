// program.cpp  7/24/2002

#include "BookCompany.h"
#include <fstream>
#include<algorithm>

int main()
{
	BookCompany company;
	company.addBook("Algorithms in C", 1998);
	company.addBook("C", 1988);
	company.addBook("C", 1978);
	company.addBook("Forth", 1972);
	company.addBook("Discrete Mathematics", 1999);
	company.addBook("Algorithms", 1990);
	company.addBook("Art of Computer Programming", 1978);
	company.addBook("Fortran", 1965);
	company.addBook("The Practice of Programming", 1999);
	//Test of removeBook
	company.removeBook("Algorithms", 1990);
	company.removeBook("none", 1234);

	cout << "Unsorted inventory" << company;

	// Anonymous function object from function class, JustTitle 
	// is created and passed to sortInventory()
	// See Book.h for definition of JustTitle
	company.sortInventory(JustTitle() );
	cout << "Sorted by Title" << company;


	// YearThenTitle  is a function class, c2 the function object.
	// See Book.h for definition of YearThenTitle
	YearThenTitle c2;
	company.sortInventory(c2);
	ofstream myout("outputFile");
	myout << "Sorted by Year then Title" << company;

	// See Book.cpp for overloaded "<"
	// See BookCompany.h for definition of sortBook 
	company.sortBooks();
	cout << "Sorted by Title then Year" << company;
	return 0;
}
