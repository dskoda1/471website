/* book.c 
   The code for comparing two book records is include in this file.
   Since the library function, strcmp, is use the string library
   must be included.
   C uses files to encapsulate data and code.  
   Code is separated in the .c file.
     This allows for separate computation units.
   The interface/specification is in the .h file.
*/
 
#include <string.h>
#include "book.h"

/* bookcmp defines the way to order for BOOK records
   The books are ordered as followed:
      ascending order of year
      if the books are published the same year then 
           the lexical order of title                   
   strcmp is in the C library, string.h and it must be included.

*/

int bookcmp (const void* b1, const void* b2){
    if (((Book*)b1)->year < ((Book* )b2)->year ) return -1;
    if (((Book*)b1)->year > ((Book* )b2)->year ) return 1;
    /*   if (b1->year > b2->year ) return 1;*/
    return strcmp(((Book*)b1)->title, ((Book*)b2)->title);
}
