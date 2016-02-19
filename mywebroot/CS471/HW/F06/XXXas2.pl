/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>) 
        Date: <DATE>
 */
/* Purpose:
 * to practice writing relations in Prolog
 * to practice letting Prolog solve queries 
 *            by writing just facts
 *            by writing clauses
 * to understand unification, the "is" predicate
 * to reenforce recursive programming
 * to reenforce the use of the list data structure in Prolog
 * to reenforce the difference between atoms and strings

 Practice:
  A) What is the result of the following query.  
     (Note there is a space between '=' and '-'.)
     ?-  X= -(3,4), Y is -(3,4), Z is abs(Y).

  B) Which of the following queries succeed?  Why?
       (X)=((3)).
       (X,Y)=((3,4)).
       (X,Y)=(1,2,3).
       (X,Y)=((3,4),(a,b)).
       (X) =(1,2,3,4)

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.

 */

/*1: Write a clause, third(Seq, E) which succeeds only if E is the 
     third element of a sequence.  The sequence must have more than 3 elements.
     e.g.
      ?- third((a,b,c,d,e,f),E).
      E = c
      Yes
      ?- third((a,b,3,4),E).
      E = 3
      Yes
      ?- third((a,b,3),E).
      No
  */





/* 2: Define a clause contains(L,S), such that it succeeds if the list L contains 
      the list S as a sequence.
      e.g. 
      ?- contains([a,g,b,d],[g,b]). 
      Yes 
      ?- contains([a,g,b,d],[g,d]). 
      no    
      ?- contains([a,g,b,d],[b,g])).
      no
      
   */




/*3: Define a procedure takeout(E, Lst1, Lst2), such that it succeeds
     if lists Lst2 is the same as list Lst1 with the element E removed
     once. e.g.
     ?- takeout(3, [1,3,6,3,1,3], R).
     R = [1, 6, 3, 1, 3] ;
     R = [1, 3, 6, 1, 3] ;
     R = [1, 3, 6, 3, 1] ;
     No
  */



/*4: Define 'isOrdered(Lst)' to succeed if the elements in the list Lst, 
     are in increasing order. e.g.
     ?- isOrdered([1,2,3,7,8,90,1000]).
     Yes
     ?- isOrdered([1,2,3,7,8,90,10]).
     No

 */ 





/*5: Assume SortedLst is a sorted list, define, 
      insert(+E,+SortedLst,?SortedWithE),
     such that SortedWithE is sorted list will all the elements of
     SortedLst and the element E.
   */





/* 6: last(Lst,Last). succeeds if Last is the last element in Lst */



/*7: init(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except 
     the last element of Lst is missing. i.e. 
           ?- init([a,b,c,d,e],Init). 
           Init = [a, b, c, d] 
           Yes
 */



/* 8: nth(Nth,Lst,Element) succeeds if the Nth element of the list,
        Lst, is Element.  The count starts with 0. i.e.

     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d
     Yes
*/


  

/* 9:  Construct a recursive Prolog program for the "replace" predicate, which 
       replaces all occurrences of an element in a list. For example,
       the goal .... 
              ?- replace(a, o, [b, a, n, a, n, a], X). 
      returns X = [b, o, n, o, n, o]. Test the predicate. Use the trace
      command on one test. Try a few tests with variables in different
      argument positions. 
*/




/* 10: Write a procedure that implements the  Ackermann's functions as defined
       in Homework assignment 1. What is the "ackermann number" for 
       your version of prolog? 
  */


