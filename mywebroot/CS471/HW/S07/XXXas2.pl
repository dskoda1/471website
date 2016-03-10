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
    What is the result of the following query. 
    (Note there is a space between prefix operators '=' ,'-' and  '*'.)
    ?-  =(X,7),Y is X+4.
    ?-  Y is -(3,4), Z is abs(Y). 
    ?-  X= *(3,4), Y is X, write(X),  X=..Lst.
    ?-  reverse([a,b,d],R), reverse(Q,[1,2,3]).
    ?-  X= 3+5, X=:=8.

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 4 lines.
   DO NOT USE ANY BUILT IN PREDICATES FOR THIS ASSIGNMENT.
 */

/*1a:  Write a clause, exactly3(Lst) which succeeds only iff Lst is a
      list with exactly 3 elements.
*/

/*1b:  Write a clause, exactlySame3(Lst) which succeeds only iff Lst is a
      list with exactly 3 equal elements.
*/


/*2a:  Write a clause, atLeast3(Lst) which succeeds only iff Lst is a
      list with at least 3 elements.
*/


/*2b:  Write a clause, atMost3(Lst) which succeeds only iff Lst is a
      list with at most 3 elements.
*/

/* 3: In Prolog, implement the predicate cube/2. 
      This predicate will relate a list of numbers to a list of numbers that,
      for each number in the first list, contains the number, the square of the 
      number, and the cube of the number.  The only modes for this predicate are: 
      cube(+Lst,,?CLst).  cube should behave as follows:
        ?- cube([3,-1,2],X).
        X = [3, 9, 27, -1, 1, -1, 2, 4, 8] 
        ?- cube([],[]).
        yes.
        ?- cube([5],[5,25,125]).
        yes.
        ?- cube([2,3],[2,3,4]).
        no.
*/


/*4: Write a Prolog predicate prefix(P,Lst) which behaves as follows:
       ?- prefix([1,2],[1,2,3]).
       Yes
       ?- prefix([1,2],[1,3,5]).
       No
       ?- prefix(X,[1,2,3]).
       X = [] ;
       X = [1] ;
       X = [1, 2] ;
       X = [1, 2, 3] ;
       No

   Note: The empty list [] is a valid prefix.
  */


/*5:  WITHOUT recursion, define a predicate suffix(S,Lst) which succeeds
      if S is a suffix of Lst.  You may use  prefix defined in exercise 4 and 
      the builtin predicate reverse.  (This will only be ONE rule.)
      suffix(S, Lst) should behaves as follows:
        ?- suffix([2,3],[1,2,3]).
        Yes
        ?- suffix([1,3],[1,2,3]).
        No
        ?- suffix(X,[1,2,3]).
        X = [1, 2, 3] ;
        X = [2, 3] ;
        X = [3] ;
        X = [] ;    
*/



/*6: We would like to implement hashTable (or associative lists) in Prolog. 
     Write a Prolog predicate hashT(L,X,Y), such that
	  hashT([ (k1,v1),(k2,v2),..., (kn,vn) ],X,Y) is true if X equals
	  some ki and Y equals the corresponding vi. When you are done,
	  you should get the following behavior: 
     
      ?- hashT([(a,1),(b,2),(c,3),(d,4),(b,5)],b,Y). Y = 2 ;
	   Y = 5 
	   Yes
	   ?- hashT([(a,1),(b,2),(c,3),(d,1),(b,5) ],X,1).
      X = a ;
	   X = d ;
	   No
	   ?- hashT([(a,1),(b,2),(c,3),(d,4),(b,5) ],c,3).
      Yes
   */

/* 7: last(Lst,Last). succeeds if Last is the last element in Lst */



/* 8: init(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the 
      last element of Lst is missing. e.g. 
        ?- init([a,b,c,d,e],Init). 
        Init  = [a, b, c, d] Yes
 */


/*9 : Define a predicate, zip(L1, L2, Z),  which succeeds is the list Z is 
      obtained by interleaving the elements of L1 and L2 into tuples.
      When you are done you should get the following behavior:
        ?- zip([1,2,3,4],[a,b,c],Z).
        Z = [ (1, a), (2, b), (3, c)] 
        Yes
        ?- zip([1,2,3],[a,b],Z).
        Z = [ (1, a), (2, b)] 
        Yes
        ?- zip([1,2,3],L,  [ (1, a), (2, b)] ).
        L = [a, b] 
        Yes
  */

 

/* 10a:  Write 4 facts with the functor name "exp",
         that will build a binary expression for each operator, +, -,* and / and
         the given operands.    
         Below the predicate, compute(A,B,V) uses exp to generate 
         a value, V.
e.g.
      ?- compute(3, 1.5, V).
              Expression is  3+1.5
      V = 4.5 ;
             Expression is  3-1.5
      V = 1.5 ;
             Expression is  3*1.5
      V = 4.5 ;
            Expression is  3/1.5
      V = 2.0 ;
      No
*/
compute(Operand1,Operand2,Value) :-  
	exp(Operand1,Operand2,Exp), 
	write('\n     Expression is  '),
	write( Exp), 
	Value is Exp.


/* 10b.:  Define a predicate, puzzle(A,B,C,D),  that succeeds if there is
      a binary combination A and B with the same value as a
      binary combination of C and D. Use exp defined above to generate the
      different combinations. You may assume A and C are the first operands
      and B and D are the second operands of the binary operations. Use write
      to print out the binary expression used to solve the puzzle.  e.g.
           ?- puzzle(5,4,3,3). 
           5+4, 3*3 
           Yes 
           ?- puzzle(5,4,3,7). 
           No
*/


/* 11: Due with assignment 3
       Write a procedure that implements the  Ackermann's functions as 
       defined in Homework assignment 1. What is the "ackermann number" for
       your version of prolog? 
  */


