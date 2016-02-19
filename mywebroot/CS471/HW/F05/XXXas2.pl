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

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.

 */

/*1: beginSame(L1, L2), succeeds if L1 and L2 have the same first element, i.e., 
   ?- beginSame([1,2,3,4],[a,2,c,b,d]).
   No
   ?- beginSame([1,2,3,4],[1,2,c,b,d]).
   Yes
 */



/*2: isPrefix(Little,Big), succeeds if Little is the prefix of Big 
i.e.
   ?- isPrefix([],[1,2,a,b,c]).
   Yes
   ?- isPrefix([1,2,a],[1,2,a,b,c]).
   Yes
   ?- isPrefix([2,a],[1,2,a,b,c]).
   No
   ?- isPrefix([1,2,a,b,c,d],[1,2,a,b,c]).
   No
  */



/*3: last(Lst,Last). succeeds if Last is the last element in Lst */




/*4: init(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the last
        element of Lst is missing.
 i.e.  
   ?- init([a,b,c,d,e],Init).
   Init = [a, b, c, d]
   Yes
 */



/* 5: nth(Num,Lst,Element) succeeds if the Numth element of the list
        Lst is Element.  The count starts with 0.
i.e.
     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d
     Yes
*/



/* 6a: Define a predicate sum(Lst, Sum), that succeeds if Sum is the sum of all 
      the numbers contained in all the lst.
*/



/* 6b: Define a predicate sumAll(LstOfLst, Sum), that succeeds if Sum is the sum of all
       the numbers contained in each list in LstOfLst.  You should use the predicate sum you 
       defined.
*/



/* 7: Write a predicate, prodRtoL(+L,?S), that given a non empty list of numbers, L, S is a list of
      the prod of the numbers in L such that first number in S is the prod of all the number L, the
      second number in S the prod of all the numbers in L except the first number in L, etc.
For example:
    ?- prodRtoL([1,2,3,4],P).
    P = [24, 24, 12, 4]
    Yes
*/



/* 8: Write a predicate prodLtoR(L,S). which is simular to prodRtoL(+L,?S), except that prod totals
      accumulate left to right.
      ?- prodLtoR([1,2,3,4],P).
      P = [1, 2, 6, 24]
      Yes
*/




/* 9: Program exercise 1.1 page 30 in prolog. i.e
       ?- numDigit(100,N).
       N = 3.
*/



/* 10: Ackermann's functions as defined in written question 1.
  */


