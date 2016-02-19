#include<algorithm>
#include"BookCompany.h"

void BookCompany::addBook(const string & title, const int & year)
{
	inventory.push_back(Book(title, year));
}

void BookCompany::removeBook(const string & title, const int & year)
{
	vector<Book>::iterator where;
	where = find(inventory.begin(), inventory.end(), Book(title, year));
	if(where != inventory.end())
		inventory.erase(where);
}

ostream& BookCompany::printBooks(ostream & out) const
{
	for_each(inventory.begin(), inventory.end(), PrintBook(out));
	out << endl << endl;
	return out;
}

ostream& operator<<(ostream & out, const BookCompany & company)
{
	return company.printBooks(out);
}

