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
   two lines and maximum number of lines is at MOST 3 lines -- except
   for the set of facts needed (i.e. each edge is represented by one
   fact in problem 1, therefore there will be 10 "edge/2" facts.)
   
   Example of using help in Swipl.
   At the prompt type:
           ?- help(functor).
           ?- help(=..)
           ?- help(arg).

Note: some prolog systems will reply yes instead of true and no
   instead of false.
 */ 

/* 1: Page 5, problem 1 in "Prolog: A Tutorial Introduction" By Lu & Mead.
      Following the example above, write a Prolog program which describes a 
      directed graph with the following structure. Also include in the program 
      a predicate which defines the `path of length 3' relation. 
      Define it in two ways: First only referencing the edge predicate,
      (call this predicate pathOfLen3A) and then making use of the tedge 
      predicate (call this predicate pathOfLen3B). Implement and test.  
      (See the text for the Graph)
   
   i.e.
     ?- pathOfLen3A(a,d).
     true
     ?- pathOfLen3B(a,d).
     true

*/


/*2: Write a non-recursive predicate yahtzee(D1,D2,D3,D4,D5) with five 
     arguments of integers (between 1 and 6) (the result of rolling five dice) 
     which succeeds if all numbers are the same, and fails otherwise. E.g.
        ?- yahtzee(2,2,2,2,2).
        Yes
        ?- yahtzee(2,2,2,3,2).
        No
*/



/* 3: Below is the (unsorted) predicate 'nums'. Each functor 'num' has an integer
      as argument.  Create an procedure (algorithm), called twoHaveSum(S), that
      succeeds if there are two numbers, either different ones or the same number,
      in the 'nums' predicate with the sum of S.  i.e..
    
         ?- twoHaveSum(10).
         true .

         ?- twoHaveSum(61).
         false.

         ?- twoHaveSum(7).
         false.
         
         ?- twoHaveSum(42).
         true .
 */

nums(15).
nums(10).
nums(13).
nums(5).
nums(3).
nums(7).
nums(17).
nums(9).
nums(21).
nums(8).



/* 4: Write a predicate 'bigger(+N)' which succeeds if 'N'
      is larger than at least one number in the predicate 'nums'.
    i.e.
      ?- bigger(4).
      true 
      ?- bigger(2).
      false.

    You may use the builtin predicate ">".  
    +Expr1 > +Expr2                                                   [ISO]
    True if expression Expr1 evaluates to a larger number than Expr2.

 */




/*5: Write a predicate begins/2 that succeeds of two list begin with
     the same value.
     i.e.
        ?- begins([1,2,3],[1,d,fg,g]).
        true.

        ?- begins([2,1,2,3],[1,2,2,3]).
        false.

 */ 
 



/* 6: lastV(Lst,Last). succeeds if Last is the last element in Lst */



/*7: initV(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the last
        element of Lst is missing. i.e. 
   ?- initV([a,b,c,d,e],Init). 
       Init = [a, b, c, d]
       
 */



/* 8: Define the procedure 'zip' so that zip(Lst1,Lst2,Zipped) succeeds if
     Zipped is a list of sequences (tuples) . The first value of the sequence 
     is from the corresponding position from Lst1 and the second value is from 
     corresponding position from Lst2. Note: The length of Zipped will be the
     minimum of the length of Lst1 and length of Lst2. e.g.
           ?- zip([1,2,3,4],[a,b,c],Z).
           Z = [ (1, a), (2, b), (3, c)] 
           
           ?- zip([a],[1,2,3,4],Z).
           Z = [ (a, 1)] 
           
*/



/* 9: Convert the "power" program given in exercise 1 homework 1.
       e.g.
       ?- power(2,5,R).
       R = 32 

*/ 


/* 10: Ackermann's functions as defined in written question 4.
*/



