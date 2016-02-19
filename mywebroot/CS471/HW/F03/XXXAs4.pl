/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
        Fall 2003 as4.pl
*/
/* The purpose is this assignment is
   1) reenforce recursive programming
   2) reenforce the use of the list data structure
   3) the difference between strings and atoms

   The first two problems are from last week.
*/



/* 1: Write a predicate ordered(L) that succeeds if and only if the 
      list of numbers, L is in non-decreasing order --each element is 
      less than or equal to the next.
*/


/* 2: Define a predicate, listOfFacts(Functor,ListOfArgs,ListOfTerms), where
      each term in the ListOfTerms is a term with
      one argument from the ListOfTerms and the name is the functor.
      Type "help" in swipl
         help(functor).
         help(=..)
         help(arg).
      for information on the built-in predicates functor,=.., arg.

      ?- listOfFacts(foo,[a,b,23,4],T).
         T = [foo(a), foo(b), foo(23), foo(4)]
	 Yes
*/

/* 3: Given a list of predicates, applylist(L) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own. (2 lines)

   i.e.
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(5,2),A=C]).
    A = 5
    B = 9
    C = 5
    yes
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(9,2),A=C]).
    no
  */



%4 deleteE(+E,+Lst1, -Lst2).
% This will only work if E and Lst1 are given.


%5. bagToSet(Bag,Set).



%5. palindrome(List).


%6. myMerge(+Lst1, +Lst2, -Result). (4 lines of code)



%7. partition(+Lst, -Part1, -Part2).



%9. myMerge(+UnsortedLst, -Sorted).


%10. mapcolor...Many possible solutions

%11. sumRtoL(+L,?S).  (2 lines)
/* Given a list of numbers, L, S is a list of the sum of the numbers in L such
   that first number in S is the sum of all the number L, the second number 
   in S the sum of all the numbers in L except the first number in L, etc.
   For example:
   3 ?- sumRtoL([1,2,3,4],S).
   S = [10, 9, 7, 4]
*/ 




%12. sumLtoR(L,S).  (2 lines)
/* Is simular to sumRtoL(+L,?S), except that sum totals 
   accumulate left to right.

     13 ?- sumLtoR([1,2,3,4],S).
     S = [1, 3, 6, 10] 

*/




13. ack ...  easy You are just rewriting the formula

