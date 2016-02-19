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

 Practice:
    What is the result of the following query.  (Note there is a space between '=' and '-'.)
    ?-  X= -(3,4), Y is -(3,4), Z is abs(Y).
 
 Example of using help in Swipl.
   At the prompt type:
           ?- help(functor).
           ?- help(=..)
           ?- help(arg). 

 Note: a string is a syntactic sugar for a list of chars.

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.

Note: some versions of Prolog return Yes/No others may return true/false.

 */


/* 1: Page 5, problem 1 in "Prolog: A Tutorial Introduction" By Lu & Mead.
    http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/PrologTutorialMeadLu.pdf
   Write a prolog program that describes the graph stucture in the tutorial.
   Also include a predicate, len3(NodeA,NodeB), which defined 'path of length 3'
   relation.  You should use tedge in your solution.
   i.e.
     ?- len3(a,d).
     Yes

*/
/* Below is code from the Tutorial */

edge(a,b).
edge(a,f).
edge(b,c).
edge(c,d).
edge(c,e).
edge(f,c).
edge(f,e).
edge(e,d).
edge(f,g).
edge(g,c).

tedge(Node1,Node2) :-
      edge(Node1,SomeNode),
      edge(SomeNode,Node2).

/* 2: Write a set of clauses, path(X,Y), which succeeds if there is a
     path from X to Y. 
 */



/* 3: Define a clause third(Lst,E) which succeeds only if E is the third 
      element in the list, Lst.  The list must have at least 3 elements.
      This can be done in one statement.
    */
    
  

/* 4: Define a predicate sum(+Lst, -S), which succeeds only if S is the sum of all the 
      numbers in the list, Lst.  You may assume lst is a non-empty list of numbers 
      and S is only used for output.
     e.g.
       13 ?- sum([1,2,3,7,9,99],S).
       S = 121 .
       14 ?- sum([1,2,3,7,9,99],21).
       false.
       15 ?- sum([1,2,3,7,9,99],121).
       true .
   Can you explain this result?
     12 ?- sum("1234990",A).
     A = 364 .
*/


/* 5: Define a predicate equal(Lst, Lst2) that succeeds only if both lists contains
      the same elements in the same order.  You may not assume both lists are input.
   e.g.
     19 ?- equal([a,b],[a,b]).
     true.

     20 ?- equal([a,23],X).
     X = [a, 23].

     21 ?- equal(X,[a,23]).
     X = [a, 23].
    
     23 ?- equal([23,b],[b,23]).
     false

*/




/* 6: In homework 1 we computed the number of digits in an integer.  Define a predicate
      numdigits(+Str, -N), which counts the number of digit.  For this problem you should
      assume the integer represented as a string.  You can assume the string
      contains only digits. 
  e.g.
   8 ?- numdigits("1234990",N).
   N = 7.
   9 ?- numdigits("1234990",7).
   true.
   10 ?- numdigits("1234990",6).
   false.
*/




/* 7: lastV(Lst,Last). succeeds if Last is the last element in Lst.
   e.g. 
     16 ?- lastV([1,2,3,7,9,99],L).
     L = 99.
  Can you explain this result? 
    17 ?- lastV("1234990",L).
    L = 48 .

 */


/*8: initV(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the last
        element of Lst is missing. i.e. 
   ?- initV([a,b,c,d,e],Init). 
   Init = [a, b, c, d] Yes
 */


/* 9: nth(Num,Lst,Element) succeeds if the Numth element of the list,Lst,
       is Element.  The count starts with 0.
i.e.
     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d
     Yes
*/

  
