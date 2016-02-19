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
 * to reenforce the use of the list data structure and sequence data structure
 * to reenforce the difference between atoms and strings

 Practice:
    What is the result of the following query.  (Note there is a space between '=' and '-'.)
    ?-  X= -(3,4), Y is -(3,4), Z is abs(Y).
    ?- X=[1,2,3,4], [H|T]=X, S=(a,b,d,e), S=(F,R).
 

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.

 */

/*1:  Write a clause, pair(X,Y,S), that succeeds if S unifies with the structure "f(X,Y)".
         This is easy.  Just think unification.
         e.g.
         ?- pair(1,2,P).
         P = f(1, 2) 
         Yes
         ?- pair(A,B,f((a,b),(1,2,3))).
         A = a, b
         B = 1, 2, 3 
         Yes
         ?- pair(A,[1,2,3],f(a,B)).
         A = a
         B = [1, 2, 3]
         Yes
  */





/* 2: Define a clause beginSame(S1,S2), such that it succeeds if sequence S1 and sequence S2
       begins with the same element.e.g.
         ?- beginSame((a,g,b,d),(a,1,2)).
         Yes
         ?- beginSame((g,b,d),(a,1)).
         No
      

  */




/*3: Define a procedure sameSize(Lst1, Lst2), such that it succeeds if lists Lst1 an Lst2 
        have the same length.  Use a recursive definition.  DO NOT USE  "length". e.g.
          ?- sameSize([1,2,3],[1,2]).
          No
          ?- sameSize([1,2,3],[a,b,c]).
          Yes


  */



/*4: Define 'duplist' procedure so that duplist(Lst,DupLst) says that DupLst is the same list
        as Lst, but with each element of Lst repeated twice in a row.
       e.g.
       ?- duplist([a,b,c,d],D).
       D = [a, a, b, b, c, c, d, d] 
       Yes
       ?- duplist(L,[1,1,a,a,(a,b),(a,b)]).
       L = [1, a, (a, b)] 
       Yes
  */


/*5: Define the procedure  'zip' so that zip(Lst1,Lst2,Zipped) succeeds if Zipped is
        a list of sequences (tuples) .  The first value of the sequence is from the
        corresponding position from Lst1 and  the second value is from corresponding
        position from Lst2.   Note: The length of Zipped will be the minimum of the length
        of Lst1 and length of Lst2. e.g.
           ?-  zip([1,2,3,4],[a,b,c],Z).
           Z = [ (1, a), (2, b), (3, c)] 
           Yes
           ?- zip([a],[1,2,3,4],Z).
           Z = [ (a, 1)] 
           Yes
  */



/*6. Define a procedure lastSame(Lst1, Lst2), such that lastSame succeeds if 
        lists Lst1 and Lst2 have the same last element.  e.g.
        ?- lastSame([a],[1,2,3,b,a]).
        Yes
        ?- lastSame([a],[1,2,3,b,a,b]).
        No
        ?- lastSame([a,bb,b,b,b],[1,b]).
        Yes
  */



/*7:   Write a procedure, sumRtoL(+L,?S), that given a non empty list of numbers,
          L,  S is a list of the sum of the numbers in L such that first number in S is the sum
          of all the number L, the second number in S the sum of all the numbers in L
          except the first number in L, etc.
            For example:
               ?- sumRtoL([2,3,4,5,6],S).
               S = [20, 18, 15, 11, 6] 
              Yes

    */




/* 8:  Construct a recursive Prolog program for the "replace" predicate, which  
          replaces all occurrences of an element in a list. For example, the goal 
                 ....?- replace(a, o, [b, a, n, a, n, a], X).
         returns X = [b, o, n, o, n, o]. Test the predicate. Use the trace command on one test. 
         Try a few tests with variables in different argument positions.
*/




/* 9: Program exercise 1.1 page 30 for positive and negative numbers in prolog. e.g.
       ?- numDigit(100,N).
       N = 3.
*/



/* 10: Write a procedure that implements the  Ackermann's functions as defined in
           Homework assignment 1. What is the  "ackermann number" for your version of prolog?
  */



