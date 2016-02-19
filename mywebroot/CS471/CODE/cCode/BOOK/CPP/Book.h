// Book.h
// defines the type Book
// a Book has a title and a year
// Operations:
//     operator==
//     operator<<
// Functors:
//     JustTitle - compares Books using just the title
//     YearThenTitle - compares Books using first the year and
//                     then the title
//     PrintBook - sends information about a Book to an output stream

#ifndef BOOK
#define BOOK

#include<string>
#include<iostream>
using namespace std;

class Book
{
public:
	string title;
	int year;

	Book(const string & title, const int & year);
	// constructor
	// preconditions: title and year are valid
	// postconditions: a Book with title and year has been constructed

	friend bool operator==(const Book & b1, const Book & b2);
	// overloaded equality operator
	// returns true iff title and year of b1 and b2 are the same

	friend ostream& operator<<(ostream & out, const Book & b); 
	// overloaded insertion operator
	// postconditions: information about b has been sent to out
	// returns: a reference to out
};

class YearThenTitle    
// class which provides a function to compare Books, using first the
// year and then the title
// an object of this class can be passed to the sort algorithm
{
public:
	// compare two Books using the year and the title
	// preconditions: b1 and b2 are the Books to be compared
	// returns: true if b1's year is less than b2's year or if b1 and b2
	// have the same year and b1's title is alphabetically before 
	// b2's title
	bool operator()(const Book & b1, const Book & b2)
	{
		return (b1.year < b2.year) || 
		       (b1.year == b2.year && b1.title < b2.title);
	}
};

class JustTitle   
// class which provides another function to compare Books, using just
// the title
// an object of this class can be passed to the sort algorithm
{
public:
	// compare two Books using only their titles
	// preconditions: b1 and b2 are the Books to be compared
	// returns: true iff b1's title is alphabetically before 
	// b2's title
	bool operator()(const Book & b1, const Book & b2)
	{
		return b1.title < b2.title;
	}
};

class PrintBook  
// class which provides a function to print information about a Book
// an object of this class can be passed to the for_each algorithm
{                 
public:
	// constructor
	// preconditions: out is the output stream to which data is 
	//                to be sent
	// postconditions: a PrintBook object has its ostream data
	//                 member inititialized to out (or cout) 
	PrintBook(ostream & out = cout): outFile(out)
	{
	}
	// print information about a Book
	// preconditions: b is the Book to be printed
	// postconditions: information about b has been sent to
	//                 the PrintBook's output stream
	void operator()(const Book & b)
	{
		outFile << b;
	}
 private:
	ostream outFile;
};
		
#endif
