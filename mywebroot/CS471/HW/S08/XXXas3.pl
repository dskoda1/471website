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
 *            by writing facts
 *            by writing clauses
 * use of nested structures vs lists
 * to reenforce recursive programming
 * to reenforce the use of the list data structure in Prolog
 
 * This assignment is not intended to be hard, however many will need
 * time to absorb how easy it really is.  One problem requires only one line,
 * most require only two lines and none require more than 3 lines.
 */
 
 
/*1a: Write a non-recursive predicate yahtzee(D1,D2,D3,D4,D5) with five 
     arguments of integers (between 1 and 6) (the result of rolling five dice) 
     which succeeds if all numbers are the same, and fails otherwise. E.g.
        ?- yahtzee(2,2,2,2,2).
        Yes
        ?- yahtzee(2,2,2,3,2).
        No
        
      What is the answer to the following query?
         ?- yahtzee(A,B,C,D,E).
     Be prepare to explain the answer in class.
*/
/*1b: Redo part 1a using a list instead of a "sequence". Call the predicate
          yahtzeeL(Lst).
    E.g.
    ?-yahtzeeL([2,2,2,2,2]).
    Yes
    ?- yahtzeeL([2,2,2,3,2]).
    No
*/

/*2: From "Learn Prolog Now!" Exercise 3.2 
     Define a predicate greater_than/2 that takes two numerals in the notation 
     that we introduced in this lecture (i.e. 0, succ(0), succ(succ(0)) ...) as 
     arguments and decides whether the first one is greater than the second one. 
    E.g:
       ?- greater_than(succ(succ(succ(0))),succ(0)).
       yes
       ?- greater_than(succ(succ(0)),succ(succ(succ(0)))).
       no
       ?- greater_than(succ(0),succ(0)).
       no
    
    succ is an example of using nested terms.
*/



/*3: Define a predicate equalLen(Lst1, Lst2), such that it succeeds if lists 
     Lst1 and Lst2 have the same length.  Use a recursive definition.  DO NOT USE
     the built in predicate  "length". e.g.
          ?- equalLen([1,2,3],[1,2]).
          No
          ?- equalLen([1,2,3],[a,b,c]).
         Yes
  */
  


/*4: Define a predicate equivalent(Lst1, Lst2), such that it succeeds if lists 
     Lst1 and Lst2 have equivalent elements in the same order.  Use a recursive 
     definition.
          ?- equivalent([1,2,3],[1,2]).
          No
          ?- equivalent([1,2,3],[1,2,3]).
          Yes
          ?- equivalent([1,2,3],[3,2,1]).
          No
  */



/* 5: Define a clause hasSubseq(L,S), such that it succeeds if the list L contains 
      the list S as a sequence. Use recursive definition.
      e.g. 
      ?-hasSubseq([a,g,b,d],[g,b]). 
      Yes 
      ?- hasSubseq([a,g,b,d],[g,d]). 
      yes
      ?- hasSubseq([a,g,b,d],[b,g]).
      no
      
   */



/* 6: last(Lst,Last). succeeds if Last is the last element in Lst */



/*7: init(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the 
     last element of Lst is missing. i.e. 
     ?- init([a,b,c,d,e],Init). 
     Init= [a, b, c, d] 
     Yes
 */



/* 8: nth(Num,Lst,Element) succeeds if the Numth element of the list
        Lst is Element. The count starts with 0.
E.g.
     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d
     Yes
*/



/*9: Define the procedure 'zip' so that zip(Lst1,Lst2,Zipped) succeeds if
     Zipped is a list of sequences (tuples) . The first value of the sequence 
     is from the corresponding position from Lst1 and the second value is from 
     corresponding position from Lst2. Note: The length of Zipped will be the
     minimum of the length of Lst1 and length of Lst2. e.g.
           ?- zip([1,2,3,4],[a,b,c],Z).
           Z = [ (1, a), (2, b), (3, c)] 
           Yes
           ?- zip([a],[1,2,3,4],Z).
           Z = [ (a, 1)] 
           Yes
*/



/*10: Implement the predicate cube/2. This predicate will relate a list of 
      numbers to a list of numbers that, for each number in the first list, 
      contains the number, the square of the number, and the cube of the number.
      The only modes for this predicate are: cube(+Lst,?CLst).
      cube should behave as follows:
        ?- cube([3,-1,2],X).
        X = [3, 9, 27, -1, 1, -1, 2, 4, 8] 
        ?- cube([],[]).
        yes.
        ?- cube([5],[5,25,125]).
        yes.
        ?- cube([2,3],[2,3,4]).
        no.
*/



