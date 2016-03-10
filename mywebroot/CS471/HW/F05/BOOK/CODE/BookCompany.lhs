=Create a module BookCompany which has data type Books and Authors

> module BookCompany where
> import List

Define a Haskell type Book for representing books.  An instance of Book should 
contain the book's title, and its year of publication.  
Book derives Show so the Hugs runtime can use "show" to displayed each Book record.

> data Book = Book Title Year deriving Show
> type Title = String
> type Year = Int

The supplied sorting algorithm provided in the List library requires the 
type in the class Ord.

Below Book is made an instance of Eq and Ord. 
This will order by Year then Title.  

> instance Eq Book where
>     Book t1 y1 == Book t2  y2 = t1==t2 && y1==y2
> instance Ord Book where
>     Book  t1 y1 < Book t2 y2 
>	    = y1<y2 || (y1==y2 && t1<t2 )
>     Book t2 y2 > Book t1 y1
>	    = y1<y2 || (y1==y2 && t1<t2 )
>     Book t1 y1 <= Book t2 y2
>	    = (Book t1 y1 < Book t2 y2)||(Book t1 y1 == Book t2 y2)



printTitles creates a string of the title of all the books 
in the input Book list.

> printTitles :: [Book] -> [String]
> printTitles [] = []
> printTitles (Book title yr:bs) 
>     = (title ++","):printTitles bs
>    


Some data for experimenting with the code.
For example:
    BookStore> sort store
    .... list of books in sorted order
    .... Note that the generic "sort" can only use ONE one set of
         overloaded functions.
    BookStore> listBooks (sort store)
    ... list of book titles in the "sorted" order
    BookStore> book1 < book5
    false
"inventory" is a hard code list of Book records.
"bookX" are just records of Book and are used to constuct,"store" 
   which is  just a list of book records 


> inventory = [Book "C" 1988, Book "C" 1978, 
>              Book "Discrete Mathematics" 1999,
>              Book "Forth" 1972,
>              Book "Java"  1996, Book "Algorithms" 1990,
>              Book "Art of Programming" 1978 ]
> book1 = Book "C" 1978
> book2 = Book "C" 1988
> book3 = Book "Algorithms" 1990
> book4 = Book "Art of Computer Programming" 1978
> book5 = Book "Fortran" 1965
> book6 = Book "The Practice of Programming" 1999
> store = [book1, book2, book3, book4, book5, book6]



          






