// BookCompany.h
// defines the type BookCompany
// a BookCompany keeps track of an inventory of Books
// Operators:
//     addBook - adds a Book to the inventory
//     removeBook - removes a Book from the inventory
//     sortInventory (template) - sorts the inventory using the functor 
//                   provided when a sortInventory method is instantiated 
//     operator<< - sends all Books in the inventory to an output stream

#ifndef BOOKCOMPANY
#define BOOKCOMPANY

#include<string>
#include<iostream>
#include<vector>
#include "Book.h"
using namespace std;

class BookCompany
{
public:
	void addBook(const string & title, const int & year);
	// add a Book to the inventory
	// preconditions: title and year are valid
	// postconditions: a Book with title and year is part of the inventory

	void removeBook(const string & title, const int & year);
	// remove a Book from the inventory
	// preconditions: title and year are valid
	// postconditions: the inventory does not contain a Book with 
	//                 title and year

	template<typename Comparator>
	void sortInventory(const Comparator & comparator)
	{	
		sort(inventory.begin(), inventory.end(), comparator);
	}
	// sorts the inventory
	// precondition: comparator is a functor which describes how to
	//               compare 2 Books
	// postconditions: the inventory is sorted according to the criteria
	//                 provided by the functor comparator
	// note: implementation included because sortInventory is a template

	ostream& printBooks(ostream & out) const;
	// print the inventory
	// preconditions: out is ready to receive output
	// postconditions: the inventory has been sent to out
	// returns: a reference to out

private:
	vector<Book> inventory;
};

ostream& operator<<(ostream & out, const BookCompany & company);
// overloaded insertion operator
// preconditions: out is ready to receive output
// postconditions: the inventory has been sent to out
// returns: a reference to out

#endif
