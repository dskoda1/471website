#include "BookCompany.h"
#include <fstream>
#include<algorithm>

int main()
{
	BookCompany company;
	company.addBook("Algorithms in C", 1998);
	company.addBook("C", 1978);
	company.addBook("C", 1988);
	company.addBook("Algorithms", 1990);
	company.addBook("Art of Computer Programming", 1978);
	company.addBook("Fortran", 1965);
	company.addBook("The Practice of Programming", 1999);
	company.removeBook("Algorithms", 1990);
	company.removeBook("none", 1234);
	cout << company;
	company.sortInventory(JustTitle());
	cout << company;
	YearThenTitle c2;
	company.sortInventory(c2);
	ofstream myout("outputFile");
	myout << company;
	return 0;
}