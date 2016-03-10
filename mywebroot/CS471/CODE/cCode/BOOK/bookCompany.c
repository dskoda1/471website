/* CS471 - Example of programming generically in C
   Eileen Head,  Binghamton University
   The c-library functions printf,qsort, and mallac are used.
   the header files, stdlib.h and stdio.h, must be included.
   qsort is a generic quick sort supplied in the C library.
   The book record is defined externally, so it also has to be included.
*/

#include <stdlib.h>
#include <stdio.h>

#include "book.h"

/* C macro.  The preprocessor will subsitute 50 for MAX_NO_BOOKS */
#define MAX_NO_BOOKS 50

/* The inventory will be a global variable in static memory. Therefore
   the code must be recompiled to increase size of array with the macro 
   MAX_NO_BOOKS changed.
*/
Book inventory [MAX_NO_BOOKS];

/* numOfBooks is the number of books in the Inventory */
int numOfBooks = 0;

/* addBook add the information to the next book record in "inventory".
   Notice I copy the address of the *title to the book record in inventory.  
   If my code changes the values stored at this location (*title) 
   the record still points here and the title is changed.
   In addition the memory allocated to "title" can be freed elsewhere,
   leaving this record pointing to garbage 
 */
void addBook(char * title, int year){
  /* This could be dangerous, I am not coping the string */
  inventory[numOfBooks].title = title;
  inventory[numOfBooks].year = year;
  numOfBooks++;
}



/* sortInventory uses the library supplied sorting program.
   qsort requires 
      an array, 
      the number of elements in the array,
      the number of bytes of the record,
           ("sizeof" is an operator in C that 
	     determine the amount of storage occupied by the data record)
      a pointer to the code used to order the data
*/
   
void sortInventory(void){
  /* Using the c-library function, qsort */
  qsort(inventory, numOfBooks, sizeof(inventory[0]),bookcmp);
}


/* Print the books in the inventory.
   printf is a C library function, stdio, and it must be included.
   The first string in printf contains the print format and the
   rest are variables to be printed out.
         Formating: %d - convert integers for printing
                    %s - convert pointer to string (array of chars)
*/
 
void showInventory (void){
  int i; 
  printf("{\n");
  for (i = 0; i < numOfBooks; i++ ){
    printf(" ( %d, %s )\n",inventory[i].year, inventory[i].title);
  }
  printf(" }\n");
}



int main(void){
  addBook("Algorithms in C",1998);
  addBook("C",1978);
  addBook("C",1988);
  addBook("Algorithms",1990);
  addBook("Art of Computer Programming",1978);
  addBook("Fortran", 1965);
  addBook("The Practice of Programming", 1999);
  printf("Inventory\n ");
  /* Print unsorted inventory */
  showInventory();
  sortInventory();
  /* Records in Inventory are rearranged! 
     Print the sorted inventory
  */
  printf("\nInventory in sorted order: \n");
  showInventory();
  return 1;
}








