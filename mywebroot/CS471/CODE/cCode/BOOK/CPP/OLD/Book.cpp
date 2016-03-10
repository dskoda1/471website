#include"Book.h"

Book::Book(const string & title, const int & year)
{
	this->title = title;
	this->year = year;
}

bool operator==(const Book & b1, const Book & b2)
{
	return (b1.title==b2.title && b1.year==b2.year);
}

ostream& operator<<(ostream & out, const Book & b)
{
	out << "\n(" <<b.title << "," << b.year << ") ";
	return out;
}
