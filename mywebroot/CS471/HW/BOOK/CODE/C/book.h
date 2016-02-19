/* book.h */
/* Book - data structure 
   Each instance of Book contains the book's title and its year of publication.
   Since the title is not a fix size we will allow memory from the heap and the
   data structure contains a pointer to this memory.
*/
typedef struct Book {
  char* title;
  int year;
} Book;

/* Function prototype for 
   bookcmp
*/
int bookcmp (const void* b1, const void* b2);
